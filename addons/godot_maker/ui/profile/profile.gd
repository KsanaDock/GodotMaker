@tool
extends VBoxContainer
## GodotMaker 用户主页面板（Profile Dock）

signal logout_requested
signal login_requested

var _auth: KAuthClient
var _asset_client: KAssetClient

# ── UI 引用 ──
@onready var _avatar_label: Label = %AvatarLabel
@onready var _avatar_rect: TextureRect = %AvatarRect
@onready var _avatar_bg: PanelContainer = %AvatarBG
@onready var _nickname_label: Label = %NicknameLabel
@onready var _email_label: Label = %EmailLabel
@onready var _bio_label: Label = %BioLabel
@onready var _plan_label: Button = %PlanLabel
@onready var _credits_label: Button = %CreditsLabel
@onready var _tab_bar: HBoxContainer = %TabBar
@onready var _asset_grid: GridContainer = %AssetGrid
@onready var _loading_label: Label = %LoadingLabel
@onready var _login_btn: Button = %LoginBtn
@onready var _auth_btn: Button = %AuthBtn
@onready var _page_bar: HBoxContainer = %PageBar
@onready var _btn_prev: Button = %BtnPrev
@onready var _btn_next: Button = %BtnNext
@onready var _page_label: Label = %PageLabel
@onready var _link_btn: Button = %LinkBtn
@onready var _language_btn: Button = %LanguageBtn

var _active_tab: String = KAssetClient.TYPE_ANIMATION
var _current_page: int = 1
var _page_size: int = 8
var _total_pages: int = 1
var _is_logged_in := false

# Tab 定义
const TABS := [
	{"key": KAssetClient.TYPE_ANIMATION, "icon": "person-standing.svg"},
	{"key": KAssetClient.TYPE_MAP, "icon": "map.svg"},
	{"key": KAssetClient.TYPE_ITEM, "icon": "sword.svg"},
	{"key": KAssetClient.TYPE_MUSIC, "icon": "music.svg"},
]


func _ready() -> void:
	name = "Profile"
	KTranslationManager.initialize()
	KTranslationManager.add_listener(_on_locale_changed)
	
	_apply_theme()
	_update_ui_localization()
	_connect_signals()


func initialize(auth: KAuthClient) -> void:
	if not is_node_ready():
		await ready
	_auth = auth
	_asset_client = KAssetClient.new(_auth)
	_asset_client.assets_loaded.connect(_on_assets_loaded)
	_asset_client.load_failed.connect(_on_load_failed)
	_set_auth_btn_mode(true) # 已登录状态
	_update_user_info()
	_load_tab(KAssetClient.TYPE_ANIMATION)


func _apply_theme() -> void:
	add_theme_constant_override("separation", 0)
	# 个人资料卡片背景
	var info_card: PanelContainer = find_child("InfoCard", true, false)
	if info_card:
		info_card.add_theme_stylebox_override("panel", KPalette.flat_box(KPalette.BG_CARD, KPalette.RADIUS_MD))
	
	_avatar_bg.add_theme_stylebox_override("panel", KPalette.flat_box(KPalette.EMERALD_DIM, KPalette.RADIUS_MD))
	
	# 右上角按钮
	_auth_btn.add_theme_stylebox_override("normal", KPalette.btn_primary())
	_auth_btn.add_theme_stylebox_override("hover", KPalette.btn_primary_hover())
	_auth_btn.add_theme_stylebox_override("pressed", KPalette.btn_primary_pressed())
	
	# 底部资产加载区域
	_login_btn.add_theme_stylebox_override("normal", KPalette.btn_primary())
	_login_btn.add_theme_stylebox_override("hover", KPalette.btn_primary_hover())
	_login_btn.add_theme_stylebox_override("pressed", KPalette.btn_primary_pressed())
	
	_btn_prev.add_theme_stylebox_override("normal", KPalette.btn_secondary())
	_btn_prev.add_theme_stylebox_override("hover", KPalette.btn_secondary_hover())
	_btn_next.add_theme_stylebox_override("normal", KPalette.btn_secondary())
	_btn_next.add_theme_stylebox_override("hover", KPalette.btn_secondary_hover())
	
	_link_btn.add_theme_stylebox_override("normal", KPalette.flat_box(KPalette.BG_CARD, 0))
	_link_btn.add_theme_stylebox_override("hover", KPalette.flat_box(KPalette.BG_HOVER, 0))

	# 优化积分和方案标签的边距，防止数字过长显示不全
	for btn in [_plan_label, _credits_label]:
		var flat_style = StyleBoxFlat.new()
		flat_style.bg_color = Color(0, 0, 0, 0)
		flat_style.content_margin_left = 2
		flat_style.content_margin_right = 2
		flat_style.content_margin_top = 0
		flat_style.content_margin_bottom = 0
		btn.add_theme_stylebox_override("normal", flat_style)
		btn.add_theme_stylebox_override("hover", flat_style)
		btn.add_theme_stylebox_override("pressed", flat_style)
		btn.add_theme_stylebox_override("focus", StyleBoxEmpty.new())
	
	# 特别设置积分颜色为黄色
	_credits_label.add_theme_color_override("font_color", Color("#facc15"))
	_credits_label.add_theme_color_override("icon_normal_color", Color("#facc15"))
	_credits_label.add_theme_color_override("icon_hover_color", Color("#facc15"))
	_credits_label.add_theme_color_override("icon_pressed_color", Color("#facc15"))
	
	_language_btn.add_theme_stylebox_override("normal", StyleBoxEmpty.new())
	_language_btn.add_theme_stylebox_override("hover", KPalette.flat_box(KPalette.BG_HOVER, KPalette.RADIUS_SM))
	_language_btn.add_theme_stylebox_override("pressed", KPalette.flat_box(KPalette.EMERALD_DIM, KPalette.RADIUS_SM))


func _on_locale_changed(_lang: String) -> void:
	_update_ui_localization()


func _tr(key: String) -> String:
	return KTranslationManager.get_text("profile", key)


func _update_ui_localization() -> void:
	# 更新页眉
	var lib_header = find_child("LibHeader", true, false)
	if lib_header:
		lib_header.text = _tr("my_library")
		
	# 更新底部链接文字
	_link_btn.text = _tr("create_more")
	
	# 更新登录登出状态按钮文字
	_set_auth_btn_mode(_is_logged_in)
	
	# 重建 Tabs
	_build_tabs()
	
	# 同步更新加载/状态文字
	_loading_label.text = _tr("loading")


func _build_tabs() -> void:
	# 先清理旧的
	for child in _tab_bar.get_children():
		child.free()
		
	for tab_def in TABS:
		var btn := Button.new()
		var tab_label = _tr(tab_def["key"]) # 这里的 key 正好对应 LOCALES 里的 key (animation, map, etc.)
		btn.text = " " + tab_label
		btn.icon = load("res://addons/godot_maker/icons/ui/" + tab_def["icon"])
		btn.add_theme_font_size_override("font_size", 11)
		btn.toggle_mode = true
		btn.button_pressed = (tab_def["key"] == _active_tab)
		btn.add_theme_stylebox_override("normal", KPalette.btn_secondary())
		btn.add_theme_stylebox_override("hover", KPalette.btn_secondary_hover())
		btn.add_theme_stylebox_override("pressed", KPalette.flat_box(KPalette.EMERALD_DIM, KPalette.RADIUS_SM))
		btn.add_theme_color_override("font_color", KPalette.TEXT_SECONDARY)
		btn.add_theme_color_override("font_pressed_color", KPalette.EMERALD)
		btn.add_theme_constant_override("h_separation", 6)
		btn.set_meta("tab_key", tab_def["key"])
		btn.pressed.connect(_on_tab_pressed.bind(btn))
		_tab_bar.add_child(btn)


func _connect_signals() -> void:
	_auth_btn.pressed.connect(_on_auth_btn_pressed)
	_language_btn.pressed.connect(_on_language_toggle)
	_login_btn.pressed.connect(_on_login_requested)
	_btn_prev.pressed.connect(_change_page.bind(-1))
	_btn_next.pressed.connect(_change_page.bind(1))
	_link_btn.add_theme_color_override("font_color", KPalette.TEXT_LINK)
	_link_btn.pressed.connect(_on_create_link_pressed)


func _on_login_requested() -> void:
	login_requested.emit()


func _on_create_link_pressed() -> void:
	OS.shell_open("https://ksanadock.com/create")


func _on_language_toggle() -> void:
	var new_lang = "en" if KTranslationManager.get_locale() == "zh" else "zh"
	KTranslationManager.set_locale(new_lang)


func _update_user_info() -> void:
	if not _auth:
		return
	var user := _auth.get_user()
	if user.is_empty():
		return

	var nick: String = user.get("nickname", "User")
	_nickname_label.text = nick
	_avatar_label.text = nick[0].to_upper() if nick.length() > 0 else "?"
	
	# 显式清除旧头像以防切号后串戏
	_avatar_rect.texture = null
	_avatar_label.visible = true
	var default_style := KPalette.flat_box(KPalette.EMERALD_DIM, KPalette.RADIUS_MD)
	default_style.content_margin_left = 0
	default_style.content_margin_right = 0
	default_style.content_margin_top = 0
	default_style.content_margin_bottom = 0
	_avatar_bg.add_theme_stylebox_override("panel", default_style)
	
	var avatar_url: String = str(user.get("avatar_url", ""))
	if avatar_url != "" and avatar_url.begins_with("http"):
		var on_avatar_loaded = func(tex: Texture2D, rect_node, label_node, bg_node):
			if not is_instance_valid(rect_node) or not is_instance_valid(label_node) or not is_instance_valid(bg_node): return
			if tex:
				rect_node.texture = tex
				rect_node.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
				label_node.visible = false
				
				# 图像加载成功时，将底层绿框替换为空对象 (纯纯透明)
				bg_node.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
				
		KImageLoader.load_texture(avatar_url, on_avatar_loaded.bind(_avatar_rect, _avatar_label, _avatar_bg))
		
	_email_label.text = user.get("email", "")
	_bio_label.text = user.get("bio", "")

	var plan: String = user.get("plan", "Free")
	var plan_icon_path := "res://addons/godot_maker/icons/ui/send.svg" # 默认为 Free 方案使用飞行纸飞机 (send.svg)
	match plan.to_lower():
		"fun": plan_icon_path = "res://addons/godot_maker/icons/ui/plane.svg"
		"pro", "founder": plan_icon_path = "res://addons/godot_maker/icons/ui/rocket.svg"
	_plan_label.text = " " + _tr("plan_prefix") + plan.capitalize()
	_plan_label.icon = load(plan_icon_path)
	_plan_label.add_theme_constant_override("h_separation", 6)

	var credits: int = user.get("credits", 0)
	_credits_label.text = " %s" % _format_number(credits) + _tr("credits_unit")
	_credits_label.icon = load("res://addons/godot_maker/icons/ui/coins.svg")
	_credits_label.add_theme_constant_override("h_separation", 6)


func _on_tab_pressed(btn: Button) -> void:
	var key: String = btn.get_meta("tab_key")
	if key == _active_tab:
		return
	_active_tab = key
	# 切换按钮状态
	for child in _tab_bar.get_children():
		if child is Button:
			child.button_pressed = (child.get_meta("tab_key") == key)
	_current_page = 1
	_load_tab(key)


func _load_tab(asset_type: String) -> void:
	if not is_instance_valid(_asset_grid):
		return
	# 切换或翻页都会清空旧内容
	for c in _asset_grid.get_children():
		c.queue_free()
	_loading_label.visible = true
	_loading_label.text = _tr("loading")
	_page_bar.visible = false
	_login_btn.visible = false

	# 停止可能正在后台播放的音乐
	KAudioLoader.stop()

	if _asset_client:
		_asset_client.fetch_assets(asset_type, _current_page, _page_size)
	else:
		_loading_label.text = _tr("not_connected")


func _on_load_failed(_type: String, error: String) -> void:
	_loading_label.text = error
	_loading_label.visible = true
	# 如果是未登录 / Token 过期，显示登录按钮并切换右上角按钮
	if "Not logged in" in error or "401" in error:
		_login_btn.visible = true
		_set_auth_btn_mode(false)

## 切换右上角按钮为 登录/登出 模式
func _set_auth_btn_mode(logged_in: bool) -> void:
	_is_logged_in = logged_in
	if not is_instance_valid(_auth_btn):
		return
	if logged_in:
		_auth_btn.text = _tr("sign_out")
		_auth_btn.icon = load("res://addons/godot_maker/icons/ui/log-out.svg")
		_auth_btn.add_theme_stylebox_override("normal", KPalette.btn_secondary())
		_auth_btn.add_theme_stylebox_override("hover", KPalette.btn_secondary_hover())
		_auth_btn.add_theme_color_override("font_color", KPalette.TEXT_SECONDARY)
	else:
		_auth_btn.text = _tr("login")
		_auth_btn.icon = load("res://addons/godot_maker/icons/ui/key.svg")
		_auth_btn.add_theme_stylebox_override("normal", KPalette.btn_primary())
		_auth_btn.add_theme_stylebox_override("hover", KPalette.btn_primary_hover())
		_auth_btn.add_theme_color_override("font_color", KPalette.TEXT_PRIMARY)


func _on_auth_btn_pressed() -> void:
	if _is_logged_in:
		logout_requested.emit()
	else:
		login_requested.emit()


func _change_page(delta: int) -> void:
	var new_page := _current_page + delta
	if new_page < 1 or new_page > _total_pages:
		return
	_current_page = new_page
	_load_tab(_active_tab)


func _on_assets_loaded(asset_type: String, assets: Array, total_count: int) -> void:
	if asset_type != _active_tab:
		return
	_loading_label.visible = false
	_login_btn.visible = false
	for c in _asset_grid.get_children():
		c.queue_free()

	if assets.is_empty():
		_loading_label.text = _tr("no_assets")
		_loading_label.visible = true
		_page_bar.visible = false
		return

	# 计算总页数
	_total_pages = maxi(1, ceili(float(total_count) / float(_page_size)))
	
	# 更新 UI
	_btn_prev.disabled = (_current_page <= 1)
	_btn_next.disabled = (_current_page >= _total_pages)
	_page_label.text = "%d / %d" % [_current_page, _total_pages]
	_page_bar.visible = (_total_pages > 1)

	for asset in assets:
		_asset_grid.add_child(_create_asset_card(asset))


func _create_asset_card(asset: Dictionary) -> PanelContainer:
	var card := PanelContainer.new()
	var bg_style := KPalette.flat_box(KPalette.BG_CARD, KPalette.RADIUS_SM)
	card.add_theme_stylebox_override("panel", bg_style)
	card.custom_minimum_size = Vector2(100, 100)
	card.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	card.tooltip_text = asset.get("name", "—")
	card.mouse_filter = Control.MOUSE_FILTER_STOP

	# 容器层级：预览图 -> (遮罩) -> 文字
	var content := VBoxContainer.new()
	content.add_theme_constant_override("separation", 0)
	card.add_child(content)

	# 1. 预览图区域
	var preview_box := Control.new()
	preview_box.custom_minimum_size.y = 70
	preview_box.clip_contents = true
	content.add_child(preview_box)

	# 预览图 TextureRect
	var tex_rect := TextureRect.new()
	tex_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tex_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tex_rect.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	# 默认为像素风格渲染（因为我们要拉取的是像素资产）
	tex_rect.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	preview_box.add_child(tex_rect)

	# 默认占位图标
	var type_icons := {
		KAssetClient.TYPE_ANIMATION: "person-standing.svg",
		KAssetClient.TYPE_MAP: "map.svg",
		KAssetClient.TYPE_ITEM: "sword.svg",
		KAssetClient.TYPE_MUSIC: "music.svg",
	}
	var icon_name: String = type_icons.get(_active_tab, "box.svg")
	
	var placeholder := TextureRect.new()
	placeholder.texture = load("res://addons/godot_maker/icons/ui/" + icon_name)
	placeholder.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	placeholder.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	placeholder.custom_minimum_size = Vector2(32, 32)
	placeholder.modulate = Color(1, 1, 1, 0.2)
	placeholder.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	preview_box.add_child(placeholder)
	
	if _active_tab == KAssetClient.TYPE_MUSIC:
		placeholder.visible = false

	# 2. 名称栏（先创建，后面音乐分支需要覆盖文本）
	var name_bar := PanelContainer.new()
	name_bar.add_theme_stylebox_override("panel", KPalette.flat_box(Color(0, 0, 0, 0.3), 0))
	var name_margin := MarginContainer.new()
	name_margin.add_theme_constant_override("margin_left", 4)
	name_margin.add_theme_constant_override("margin_right", 4)
	
	var name_label := Label.new()
	name_label.text = asset.get("name", "—")
	name_label.add_theme_font_size_override("font_size", 10)
	name_label.add_theme_color_override("font_color", KPalette.TEXT_SECONDARY)
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	name_margin.add_child(name_label)
	name_bar.add_child(name_margin)

	# 异步加载图片 / 音乐特殊处理
	if _active_tab == KAssetClient.TYPE_MUSIC:
		# 音乐：不需要加载图片，显示播放按钮
		var play_btn := Button.new()
		play_btn.icon = load("res://addons/godot_maker/icons/ui/play.svg")
		play_btn.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		play_btn.add_theme_stylebox_override("normal", KPalette.flat_box(Color(0, 0, 0, 0), 0))
		play_btn.add_theme_stylebox_override("hover", KPalette.flat_box(KPalette.EMERALD_DIM, KPalette.RADIUS_SM))
		play_btn.add_theme_stylebox_override("pressed", KPalette.flat_box(KPalette.EMERALD, KPalette.RADIUS_SM))
		play_btn.add_theme_color_override("font_color", KPalette.EMERALD)
		play_btn.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
		preview_box.add_child(play_btn)
		
		var audio_url: String = str(asset.get("audio_url", ""))
		if audio_url != "":
			play_btn.pressed.connect(func():
				KAudioLoader.play(audio_url)
				# 切换按钮图标
				if KAudioLoader.is_playing_url(audio_url):
					play_btn.icon = load("res://addons/godot_maker/icons/ui/pause.svg")
				else:
					play_btn.icon = load("res://addons/godot_maker/icons/ui/play.svg")
			)
		
		# 音乐名称优先从 metadata.name 或 prompt 取
		var meta = asset.get("metadata", {})
		var music_name: String = ""
		if meta is Dictionary:
			music_name = str(meta.get("name", ""))
			if music_name == "": music_name = str(asset.get("prompt", ""))
		if music_name == "": music_name = str(asset.get("name", "Untitled Music"))
		name_label.text = music_name
	else:
		var img_url: String = str(asset.get("image_url", ""))
		if img_url != "":
			# Godot 4 闭包捕获 Node 在被释放时会报错 "Lambda capture freed"
			# 解决办法：改为显式 bind() 传入这两个 Node，这样闭包不自动捕获外部变量
			var on_image_loaded = func(tex: Texture2D, ph_node, tex_node):
				if not tex: return
				if not is_instance_valid(ph_node) or not is_instance_valid(tex_node): return
				ph_node.visible = false
				
				if _active_tab == KAssetClient.TYPE_ANIMATION:
					var atlas := AtlasTexture.new()
					atlas.atlas = tex
					
					var frame_w: int = 48
					var frame_h: int = 48
					var columns: int = 4
					
					var config = asset.get("sprite_config", {})
					if config is Dictionary:
						if config.has("frame_size") and config["frame_size"] is Dictionary:
							frame_w = int(config["frame_size"].get("width", 48))
							frame_h = int(config["frame_size"].get("height", 48))
						if config.has("grid") and config["grid"] is Dictionary:
							columns = int(config["grid"].get("columns", 4))
					else:
						var meta2 = asset.get("metadata", {})
						if meta2 is Dictionary:
							frame_w = int(meta2.get("frame_size", 48))
							frame_h = frame_w
					
					if frame_w <= 0: frame_w = 48
					if frame_h <= 0: frame_h = 48
					if columns <= 0: columns = tex.get_width() / frame_w
					
					atlas.region = Rect2(0, 0, frame_w, frame_h)
					tex_node.texture = atlas
					_animate_atlas(atlas, frame_w, columns)
				else:
					tex_node.texture = tex
					
			KImageLoader.load_texture(img_url, on_image_loaded.bind(placeholder, tex_rect))

	content.add_child(name_bar)

	return card


func _animate_atlas(atlas: AtlasTexture, frame_w: int, frames_count: int) -> void:
	if frames_count <= 1: return
	
	# 设置一个定时循环
	var frame := 0
	while is_instance_valid(atlas):
		# 每一帧停留 0.2 秒
		await Engine.get_main_loop().create_timer(0.2).timeout
		if not is_instance_valid(atlas): break
		frame = (frame + 1) % frames_count
		atlas.region.position.x = frame * frame_w


## 数字千分位格式化 (例如 1234567 -> 1,234,567)
func _format_number(n: int) -> String:
	var s := str(n)
	var res := ""
	var count := 0
	for i in range(s.length() - 1, -1, -1):
		res = s[i] + res
		count += 1
		if count % 3 == 0 and i > 0:
			res = "," + res
	return res
