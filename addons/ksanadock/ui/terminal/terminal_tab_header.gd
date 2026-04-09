@tool
extends PanelContainer

signal selected
signal closed

@onready var _label_btn: Button = %LabelBtn
@onready var _close_btn: Button = %CloseBtn

var _tab_name: String = ""
var _active: bool = false

func _ready() -> void:
	_close_btn.visible = false # 默认隐藏
	_label_btn.pressed.connect(func(): selected.emit())
	_close_btn.pressed.connect(func(): closed.emit())
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	# 设置文本和样式
	if _tab_name != "":
		_label_btn.text = _tab_name
	_update_style()

func set_tab_name(n: String) -> void:
	_tab_name = n
	if is_node_ready():
		_label_btn.text = n

func set_active(a: bool) -> void:
	_active = a
	_update_style()

func _on_mouse_entered() -> void:
	_close_btn.visible = true
	if not _active:
		add_theme_stylebox_override("panel", KPalette.flat_box(KPalette.BG_HOVER, 0))

func _on_mouse_exited() -> void:
	# 检查鼠标是否真离开了这个区域 (处理子节点遮挡导致的假退出)
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
		_label_btn.add_theme_color_override("font_color", Color.WHITE)
		_close_btn.visible = true
		add_theme_stylebox_override("panel", KPalette.flat_box(KPalette.BG_CARD, 0))
	else:
		_label_btn.add_theme_color_override("font_color", KPalette.TEXT_DIM)
		_close_btn.visible = false
		add_theme_stylebox_override("panel", KPalette.flat_box(Color.TRANSPARENT, 0))
