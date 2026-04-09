@tool
extends PanelContainer

signal selected
signal closed

@onready var _label: Label = %Label
@onready var _close_btn: Button = %CloseBtn

var _tab_name: String = ""
var _active: bool = false

func _ready() -> void:
	_close_btn.visible = false
	_close_btn.pressed.connect(func(): 
		_on_close_pressed()
	)
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	if _tab_name != "":
		_label.text = _tab_name
	_update_style()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			selected.emit()
			accept_event()

func _on_close_pressed() -> void:
	# 显式停止事件传递，并发送关闭信号
	closed.emit()

func set_tab_name(n: String) -> void:
	_tab_name = n
	if is_node_ready():
		_label.text = n

func set_active(a: bool) -> void:
	_active = a
	_update_style()

func _on_mouse_entered() -> void:
	_close_btn.visible = true
	if not _active:
		add_theme_stylebox_override("panel", KPalette.flat_box(KPalette.BG_HOVER, 0))

func _on_mouse_exited() -> void:
	var local_mouse = get_local_mouse_position()
	if get_rect().has_point(local_mouse):
		return
		
	if not _active:
		_close_btn.visible = false
		add_theme_stylebox_override("panel", KPalette.flat_box(Color.TRANSPARENT, 0))

func _update_style() -> void:
	if not is_node_ready():
		return
		
	if _active:
		_label.add_theme_color_override("font_color", Color.WHITE)
		_close_btn.visible = true
		add_theme_stylebox_override("panel", KPalette.flat_box(KPalette.BG_CARD, 0))
	else:
		_label.add_theme_color_override("font_color", KPalette.TEXT_DIM)
		_close_btn.visible = false
		add_theme_stylebox_override("panel", KPalette.flat_box(Color.TRANSPARENT, 0))
