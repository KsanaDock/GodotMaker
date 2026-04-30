@tool
extends VBoxContainer

@onready var _history: RichTextLabel = %History
@onready var _input: LineEdit = %Input
@onready var _prompt_label: Label = %Prompt

var _command_history: Array[String] = []
var _history_index: int = -1
var _active_threads: Array[Thread] = []

func _ready() -> void:
	_input.text_submitted.connect(_on_command_submitted)
	_input.gui_input.connect(_on_input_gui_input)
	_history.append_text("[color=#34d399]GodotMaker Terminal[/color] - Ready\n")
	_update_prompt()

func _update_prompt() -> void:
	var cwd := ProjectSettings.globalize_path("res://")
	_prompt_label.text = cwd + " >"

func _on_command_submitted(cmd: String) -> void:
	if cmd.strip_edges() == "":
		return
	
	_input.clear()
	_history.append_text("\n[color=#3b82f6][b]> %s[/b][/color]\n" % cmd)
	
	_command_history.append(cmd)
	_history_index = _command_history.size()
	
	_execute_command(cmd)

func _execute_command(cmd: String) -> void:
	# 使用线程避免阻塞 UI
	var thread := Thread.new()
	var err := thread.start(_run_shell.bind(cmd))
	if err == OK:
		_active_threads.append(thread)
	else:
		push_error("[GodotMaker] Failed to start terminal thread: %d" % err)
		_on_command_finished(["Failed to start process"], -1)

func _run_shell(cmd: String) -> void:
	var output = []
	var shell = "powershell.exe"
	var args = ["-NoProfile", "-Command", cmd]
	
	var exit_code = OS.execute(shell, args, output, true)
	
	# 回到主线程更新 UI
	call_deferred("_on_command_finished", output, exit_code)

func _on_command_finished(output: Array, exit_code: int) -> void:
	for line in output:
		_history.append_text(line)
	
	if exit_code != 0:
		_history.append_text("\n[color=#f87171]Process exited with code: %d[/color]\n" % exit_code)
	else:
		_history.append_text("\n[color=#34d399]Done.[/color]\n")
	
	_history.scroll_to_line(_history.get_line_count())
	_update_prompt()
	
	# 清理已完成的线程
	_cleanup_finished_threads()

func _cleanup_finished_threads() -> void:
	var i := 0
	while i < _active_threads.size():
		var t = _active_threads[i]
		if not t.is_alive():
			t.wait_to_finish()
			_active_threads.remove_at(i)
		else:
			i += 1

func _exit_tree() -> void:
	# 确保所有线程在节点销毁前完成
	for t in _active_threads:
		if t.is_alive():
			# 强制等待可能会导致 UI 短暂卡顿，但在编辑器插件中安全销毁更重要
			t.wait_to_finish()
	_active_threads.clear()

func clear_history() -> void:
	_history.clear()
	_history.append_text("[color=#34d399]Terminal Cleared[/color]\n")
	_update_prompt()

func _on_input_gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_UP:
			_navigate_history(-1)
			accept_event()
		elif event.keycode == KEY_DOWN:
			_navigate_history(1)
			accept_event()

func _navigate_history(delta: int) -> void:
	if _command_history.is_empty():
		return
	
	_history_index = clampi(_history_index + delta, 0, _command_history.size())
	
	if _history_index == _command_history.size():
		_input.text = ""
	else:
		_input.text = _command_history[_history_index]
		_input.caret_column = _input.text.length()
