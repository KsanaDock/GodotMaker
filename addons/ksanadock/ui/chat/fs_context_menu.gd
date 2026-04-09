@tool
extends EditorContextMenuPlugin
## KsanaDock 文件系统右键菜单插件
## 为 FileSystem 面板提供 "Add to KsanaDock Chat" 右键选项

var _plugin_ref: EditorPlugin


func setup(plugin: EditorPlugin) -> void:
	_plugin_ref = plugin


func _popup_menu(paths: PackedStringArray) -> void:
	var action_callable = func(_user_data):
		var chat = _get_chat()
		if not chat or not chat.has_method("add_context_reference"):
			return
		
		# 1. 优先尝试获取脚本编辑器的选区
		var se = EditorInterface.get_script_editor()
		var current_editor = se.get_current_editor()
		if current_editor:
			var base_editor = current_editor.get_base_editor()
			if base_editor and base_editor is CodeEdit and base_editor.has_selection():
				chat.add_context_reference("text", base_editor.get_selected_text())
				return

		# 2. 如果没有脚本选区，则是文件系统引用
		for p in paths:
			chat.add_context_reference("file", p)
	
	add_context_menu_item("Add to KsanaDock Chat", action_callable)


func _get_chat() -> Node:
	if not _plugin_ref:
		return null
	return _plugin_ref.get_chat_panel()
