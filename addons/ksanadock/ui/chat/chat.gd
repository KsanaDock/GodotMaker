@tool
extends VBoxContainer
## KsanaDock AI 对话面板（Chat Dock）

const MessageBubble = preload("res://addons/ksanadock/ui/chat/message_bubble.gd")

var _auth: KAuthClient
var _ai_client: KAIClient
var _bridge: Node # The KsanaDock Bridge instance

@onready var _msg_list: VBoxContainer = %MsgList
@onready var _scroll: ScrollContainer = %Scroll
@onready var _input_field: TextEdit = %InputField
@onready var _send_btn: Button = %SendBtn
@onready var _model_btn: OptionButton = %ModelBtn
@onready var _clear_btn: Button = %ClearBtn
@onready var _ctx_scene_btn: Button = %CtxSceneBtn
@onready var _ref_list: HBoxContainer = %RefList

var _messages: Array[Dictionary] = []  # {role, content}
var _current_bubble: PanelContainer = null
var _is_streaming := false
var _active_subagents: Dictionary = {} # agentId -> MessageBubble
var _context_refs: Array[Dictionary] = [] # {type, data, label}


func _ready() -> void:
	name = "Chat"
	if _scroll:
		_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_apply_theme()
	_connect_signals()


func initialize(auth: KAuthClient) -> void:
	_auth = auth
	_ai_client = KAIClient.new()
	_ai_client.initialize(_auth)
	_ai_client.stream_chunk.connect(_on_stream_chunk)
	_ai_client.stream_done.connect(_on_stream_done)
	_ai_client.stream_error.connect(_on_stream_error)
	# 欢迎消息
	_add_bubble(MessageBubble.Role.AI, "你好！我是 KsanaDock AI 助手 [img=16]res://addons/ksanadock/icons/ui/sparkles.svg[/img]\n有什么可以帮你的？")


func _apply_theme() -> void:
	if not _send_btn: return
	_send_btn.add_theme_stylebox_override("normal", KPalette.btn_primary())
	_send_btn.add_theme_stylebox_override("hover", KPalette.btn_primary_hover())
	_send_btn.add_theme_stylebox_override("pressed", KPalette.btn_primary_pressed())
	_send_btn.add_theme_color_override("font_color", KPalette.TEXT_PRIMARY)
	
	_clear_btn.add_theme_stylebox_override("normal", KPalette.btn_secondary())
	_clear_btn.add_theme_stylebox_override("hover", KPalette.btn_secondary_hover())
	
	_ctx_scene_btn.add_theme_stylebox_override("normal", KPalette.btn_secondary())
	_ctx_scene_btn.add_theme_stylebox_override("hover", KPalette.btn_secondary_hover())

	var input_normal := KPalette.input_style_normal()
	var input_focused := KPalette.input_style_focused()
	_input_field.add_theme_stylebox_override("normal", input_normal)
	_input_field.add_theme_color_override("font_color", KPalette.TEXT_PRIMARY)
	_input_field.add_theme_color_override("font_placeholder_color", KPalette.TEXT_DIM)
	
	_input_field.focus_entered.connect(func():
		_input_field.add_theme_stylebox_override("normal", input_focused)
	)
	_input_field.focus_exited.connect(func():
		_input_field.add_theme_stylebox_override("normal", input_normal)
	)


func _connect_signals() -> void:
	_send_btn.pressed.connect(_send_message)
	_clear_btn.pressed.connect(_clear_chat)
	_ctx_scene_btn.pressed.connect(_attach_scene_context)
	
	var grab_btn = Button.new()
	grab_btn.text = " 引用输出"
	grab_btn.add_theme_font_size_override("font_size", 11)
	grab_btn.add_theme_stylebox_override("normal", KPalette.btn_secondary())
	grab_btn.pressed.connect(_grab_output_selection)
	if has_node("%CtxBar"):
		get_node("%CtxBar").add_child(grab_btn)


func _gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.ctrl_pressed and event.keycode == KEY_L:
			_clear_chat()
			accept_event()


func _input(event: InputEvent) -> void:
	if not _input_field or not _input_field.has_focus():
		return
	if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:
		if not event.shift_pressed:
			_send_message()
			get_viewport().set_input_as_handled()


func _send_message() -> void:
	if _is_streaming:
		return
	var text := _input_field.text.strip_edges()
	if text == "" and _context_refs.is_empty():
		return

	# 构建上下文内容
	var full_context = ""
	for ref in _context_refs:
		if ref.type == "file":
			full_context += "[Context File: %s]\n" % ref.data
		elif ref.type == "text":
			full_context += "[Context Reference]:\n%s\n" % ref.data
		elif ref.type == "code":
			var meta = ref.get("meta", {})
			var file = meta.get("file", "unknown")
			var fl = meta.get("from_line", 0)
			var tl = meta.get("to_line", 0)
			full_context += "[Code Reference: %s (lines %d-%d)]\n```gdscript\n%s\n```\n" % [file, fl, tl, ref.data]
	
	if full_context != "":
		text = "--- Context References ---\n" + full_context + "\n--- User Question ---\n" + text

	_input_field.text = ""
	_add_bubble(MessageBubble.Role.USER, text)
	_messages.append({"role": "user", "content": text})
	
	_context_refs.clear()
	_update_ref_list()

	_is_streaming = true
	_send_btn.disabled = true

	if _bridge and _bridge.has_method("send_chat_to_agent"):
		_bridge.send_chat_to_agent(text, _on_bridge_response, false)
	elif _ai_client:
		_ai_client.send_message(_messages, _model_btn.get_item_text(_model_btn.selected))
	else:
		_on_stream_done("（AI 客户端未连接）")


func add_context_reference(type: String, data: String, meta: Dictionary = {}) -> void:
	# 去重复
	for ref in _context_refs:
		if ref.type == type and ref.data == data:
			return
	
	var label = data
	if type == "file":
		label = data.get_file()
	elif type == "text":
		label = data.left(15) + "..."
	elif type == "code":
		# Cursor 风格： filename.gd:11-15
		var fname = meta.get("file", "").get_file()
		var fl = meta.get("from_line", 0)
		var tl = meta.get("to_line", 0)
		label = "%s:%d-%d" % [fname if fname != "" else "code", fl, tl]
	
	_context_refs.append({"type": type, "data": data, "label": label, "meta": meta})
	_update_ref_list()


func _update_ref_list() -> void:
	if not _ref_list: return
	for c in _ref_list.get_children():
		c.queue_free()
	
	for i in range(_context_refs.size()):
		var ref = _context_refs[i]
		var btn := Button.new()
		var icon = "📄 " if ref.type == "file" else ("💻 " if ref.type == "code" else "📝 ")
		btn.text = icon + ref.label + " ✕"
		btn.add_theme_font_size_override("font_size", 10)
		btn.pressed.connect(func():
			_context_refs.remove_at(i)
			_update_ref_list()
		)
		_ref_list.add_child(btn)


func _grab_output_selection() -> void:
	var output_rtc = _find_output_log(EditorInterface.get_base_control())
	if output_rtc and not output_rtc.get_selected_text().is_empty():
		add_context_reference("text", output_rtc.get_selected_text())
	else:
		var clip = DisplayServer.clipboard_get()
		if clip != "":
			add_context_reference("text", clip)


func _find_output_log(node: Node) -> RichTextLabel:
	if node is RichTextLabel and (node.name.to_lower().contains("log") or node.name.to_lower().contains("filter")):
		return node
	for child in node.get_children():
		var res = _find_output_log(child)
		if res: return res
	return null


func _on_bridge_response(result: Dictionary) -> void:
	if result.has("error"):
		_on_stream_error(str(result.error))
		return
	var type = result.get("type", "text")
	if type == "plan":
		_add_plan_bubble(result.get("data", {}), result.get("tool_call_id", ""))


func _add_plan_bubble(data: Dictionary, tool_call_id: String) -> void:
	_is_streaming = false
	_send_btn.disabled = false
	if _current_bubble:
		_current_bubble.queue_free()
		_current_bubble = null
	var bubble := PanelContainer.new()
	bubble.set_script(MessageBubble)
	bubble.setup_plan(data.get("title", ""), data.get("steps", []))
	_msg_list.add_child(bubble)
	bubble.plan_approved.connect(func(auto_run: bool):
		var msg = "开始全速执行计划。" if auto_run else "开始逐步执行计划。"
		_send_direct_message(msg, auto_run)
	)
	_scroll_to_bottom()


func _send_direct_message(text: String, auto_run: bool = false) -> void:
	_add_bubble(MessageBubble.Role.USER, text)
	_messages.append({"role": "user", "content": text})
	_is_streaming = true
	_send_btn.disabled = true
	if _bridge and _bridge.has_method("send_chat_to_agent"):
		_bridge.send_chat_to_agent(text, _on_bridge_response, auto_run)


func set_bridge(bridge: Node) -> void:
	_bridge = bridge
	if _bridge.has_signal("agent_event"):
		_bridge.agent_event.connect(_on_agent_event)
	if _bridge.has_signal("agent_reply"):
		_bridge.agent_reply.connect(_on_agent_reply)
	if _bridge.has_method("get_agent_history"):
		_bridge.get_agent_history(_render_history)


func _render_history(history: Variant) -> void:
	if not history is Array or history.is_empty():
		return
	for c in _msg_list.get_children():
		c.queue_free()
	_messages.clear()
	for msg in history:
		var role_str = msg.get("role", "")
		var content = msg.get("content", "")
		var role = MessageBubble.Role.AI
		if role_str == "user":
			role = MessageBubble.Role.USER
		elif role_str == "tool":
			role = MessageBubble.Role.TOOL_EXEC
		_add_bubble(role, content)
		_messages.append({"role": role_str, "content": content})
	_scroll_to_bottom()


func _on_agent_event(params: Dictionary) -> void:
	var event_type = params.get("type", "")
	var msg = params.get("message", "")
	var agent_id = params.get("agentId", "")
	if event_type == "process_start":
		_add_bubble(MessageBubble.Role.SYSTEM_EVENT, msg)
		_is_streaming = true
		_send_btn.disabled = true
	elif event_type == "tool_execution":
		_add_bubble(MessageBubble.Role.TOOL_EXEC, msg)
	elif event_type == "error":
		_on_stream_error(msg)
	elif event_type == "process_end":
		_is_streaming = false
		_send_btn.disabled = false
		_add_bubble(MessageBubble.Role.SYSTEM_EVENT, msg)
	elif event_type == "subagent_start":
		var bubble = PanelContainer.new()
		bubble.set_script(MessageBubble)
		bubble.setup_subagent(params.get("title", "Background Task"))
		bubble.append_subagent_log(msg)
		_msg_list.add_child(bubble)
		_active_subagents[agent_id] = bubble
		_scroll_to_bottom()
	elif event_type == "subagent_tool":
		var sub_bubble = _active_subagents.get(agent_id)
		if sub_bubble:
			sub_bubble.append_subagent_log(msg)
			_scroll_to_bottom()
	elif event_type == "subagent_end":
		var sub_bubble = _active_subagents.get(agent_id)
		if sub_bubble:
			sub_bubble.append_subagent_log("[color=#4ade80]✔[/color] " + msg)
			_active_subagents.erase(agent_id)
			_scroll_to_bottom()


func _on_agent_reply(params: Dictionary) -> void:
	var text = params.get("text", "")
	if text != "":
		_current_bubble = _create_bubble(MessageBubble.Role.AI, "")
		_msg_list.add_child(_current_bubble)
		_on_stream_done(text)


func _on_stream_chunk(text: String) -> void:
	if _current_bubble:
		_current_bubble.append_text(text)
	_scroll_to_bottom()


func _on_stream_done(full_text: String) -> void:
	_is_streaming = false
	_send_btn.disabled = false
	_messages.append({"role": "assistant", "content": full_text})
	if _current_bubble and _current_bubble.has_method("set_message"):
		_current_bubble.set_message(full_text)
	_current_bubble = null
	_scroll_to_bottom()


func _on_stream_error(message: String) -> void:
	_is_streaming = false
	_send_btn.disabled = false
	_add_bubble(MessageBubble.Role.AI, "[img=16]res://addons/ksanadock/icons/ui/triangle-alert.svg[/img] Error: %s" % message)
	_current_bubble = null


func _add_bubble(role: int, text: String) -> void:
	var bubble := _create_bubble(role, text)
	if _msg_list:
		_msg_list.add_child(bubble)
	_scroll_to_bottom()


func _create_bubble(role: int, text: String) -> PanelContainer:
	var bubble := PanelContainer.new()
	bubble.set_script(MessageBubble)
	bubble.setup(role, text)
	return bubble


func _scroll_to_bottom() -> void:
	if not is_inside_tree() or not _scroll: return
	await get_tree().process_frame
	_scroll.scroll_vertical = int(_scroll.get_v_scroll_bar().max_value)


func _clear_chat() -> void:
	if _msg_list:
		for c in _msg_list.get_children():
			c.queue_free()
	_messages.clear()
	_active_subagents.clear()
	_current_bubble = null


func _attach_scene_context() -> void:
	var scene_root := EditorInterface.get_edited_scene_root()
	if not scene_root:
		_input_field.text += "\n[No scene open]"
		return
	var tree_text := _dump_tree(scene_root, 0)
	_input_field.text += "\n--- Scene Tree ---\n" + tree_text


func _dump_tree(node: Node, depth: int) -> String:
	var indent := "  ".repeat(depth)
	var line := "%s%s (%s)\n" % [indent, node.name, node.get_class()]
	for child in node.get_children():
		line += _dump_tree(child, depth + 1)
	return line
