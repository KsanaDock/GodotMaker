@tool
extends VBoxContainer

const TerminalTabScene = preload("res://addons/godot_maker/ui/terminal/terminal_tab.tscn")
const SidebarItemScene = preload("res://addons/godot_maker/ui/terminal/terminal_sidebar_item.tscn")

@onready var _tab_container: TabContainer = %TabContainer
@onready var _sidebar_list: VBoxContainer = %SidebarList
@onready var _sidebar_panel: PanelContainer = %Sidebar
@onready var _top_bar: PanelContainer = %TopBar
@onready var _add_btn: Button = %AddBtn
@onready var _clear_btn: Button = %ClearBtn
@onready var _kill_btn: Button = %KillBtn

func _ready() -> void:
	_apply_styles()
	_add_btn.pressed.connect(add_new_tab)
	_clear_btn.pressed.connect(clear_current_tab)
	_kill_btn.pressed.connect(func(): kill_tab(_tab_container.current_tab))
	
	_tab_container.tab_changed.connect(_on_tab_changed)
	
	# 初始化一个页签
	if _tab_container.get_tab_count() == 0:
		add_new_tab()
	else:
		_sync_sidebar()

func _apply_styles() -> void:
	# TopBar 样式
	_top_bar.add_theme_stylebox_override("panel", KPalette.flat_box(Color(0.12, 0.12, 0.12, 1), 0))
	for btn in [_add_btn, _clear_btn, _kill_btn]:
		btn.add_theme_color_override("icon_normal_color", Color.WHITE)
		btn.add_theme_color_override("icon_hover_color", Color(0.8, 0.8, 0.8, 1))

	# Sidebar 背景色 (VS Code 风格)
	_sidebar_panel.add_theme_stylebox_override("panel", KPalette.flat_box(Color(0.12, 0.12, 0.12, 1), 0))
	
	# TabContainer 简单背景
	_tab_container.add_theme_stylebox_override("panel", KPalette.flat_box(Color(0.11, 0.11, 0.11, 1), 0))

func add_new_tab() -> void:
	var new_tab = TerminalTabScene.instantiate()
	var count = _tab_container.get_tab_count() + 1
	new_tab.name = "Terminal %d" % count
	_tab_container.add_child(new_tab)
	
	# 先设置目标页签，再同步侧边栏，确保初始状态正确
	_tab_container.current_tab = _tab_container.get_tab_count() - 1
	_sync_sidebar()

func _sync_sidebar() -> void:
	# 立即移除现有侧边栏项，确保 get_child_count() 瞬间归零
	for child in _sidebar_list.get_children():
		_sidebar_list.remove_child(child)
		child.queue_free()
	
	for i in range(_tab_container.get_tab_count()):
		var tab = _tab_container.get_child(i)
		var item = SidebarItemScene.instantiate()
		item.set_tab_name(tab.name)
		item.set_active(i == _tab_container.current_tab)
		
		var idx = i
		item.selected.connect(func(): _tab_container.current_tab = idx)
		item.closed.connect(func(): kill_tab(idx))
		
		_sidebar_list.add_child(item)

func _on_tab_changed(_idx: int) -> void:
	for i in range(_sidebar_list.get_child_count()):
		var item = _sidebar_list.get_child(i)
		item.set_active(i == _tab_container.current_tab)

func clear_current_tab() -> void:
	var current = _tab_container.current_tab
	if current < 0: return
	var node = _tab_container.get_child(current)
	if node and node.has_method("clear_history"):
		node.clear_history()

func kill_tab(tab_idx: int) -> void:
	if tab_idx < 0 or tab_idx >= _tab_container.get_tab_count():
		return
	
	var node = _tab_container.get_child(tab_idx)
	if node:
		_tab_container.remove_child(node)
		node.queue_free()
	
	# 如果删光了，补一个
	if _tab_container.get_tab_count() == 0:
		add_new_tab()
	else:
		_sync_sidebar()
