@tool
extends Window
## KsanaDock 登录面板 — 仅逻辑，UI 由 login_panel.tscn 定义

signal login_success(token: String, user: Dictionary)

var _auth: KAuthClient
var _loading := false

@onready var _logo_rect: TextureRect = %LogoRect
@onready var _email_input: LineEdit = %EmailInput
@onready var _password_input: LineEdit = %PasswordInput
@onready var _login_btn: Button = %LoginButton
@onready var _error_label: RichTextLabel = %ErrorLabel


func _ready() -> void:
	close_requested.connect(hide)
	_login_btn.pressed.connect(_do_login)
	_password_input.text_submitted.connect(func(_t): _do_login())
	_try_load_logo()
	# LineEdit 没有 focus 样式主题项，需要通过信号程序化切换 normal 样式
	_setup_lineedit_focus(_email_input)
	_setup_lineedit_focus(_password_input)


func _setup_lineedit_focus(input: LineEdit) -> void:
	var style_normal := KPalette.input_style_normal()
	var style_focused := KPalette.input_style_focused()
	input.add_theme_stylebox_override("normal", style_normal)
	input.focus_entered.connect(func():
		input.add_theme_stylebox_override("normal", style_focused)
	)
	input.focus_exited.connect(func():
		input.add_theme_stylebox_override("normal", style_normal)
	)

func set_auth(auth: KAuthClient) -> void:
	_auth = auth
	_auth.login_success.connect(_on_login_ok)
	_auth.login_failed.connect(_on_login_fail)


func _try_load_logo() -> void:
	var tex := load("res://addons/ksanadock/icons/logo.png")
	if tex:
		_logo_rect.texture = tex


func _do_login() -> void:
	if _loading:
		return
	_error_label.visible = false
	var email := _email_input.text.strip_edges()
	var pw := _password_input.text
	if email == "" or pw == "":
		_show_error("Please enter both email and password.")
		return
	_set_loading(true)
	if _auth:
		_auth.login(email, pw)
	else:
		await get_tree().create_timer(0.5).timeout
		_on_login_ok("stub_token", {})


func _on_login_ok(token: String, user: Dictionary) -> void:
	_set_loading(false)
	login_success.emit(token, user)
	queue_free()


func _on_login_fail(error: String) -> void:
	_set_loading(false)
	_show_error(error)


func _show_error(msg: String) -> void:
	_error_label.text = "[img=14]res://addons/ksanadock/icons/ui/triangle-alert.svg[/img] " + msg
	_error_label.visible = true


func _set_loading(v: bool) -> void:
	_loading = v
	_login_btn.disabled = v
	_login_btn.text = "Signing in..." if v else "Sign In  →"
	_email_input.editable = !v
	_password_input.editable = !v
