@tool
class_name KTranslationManager
## KsanaDock 全局本地化管理器

# 静态变量，手动维护监听列表以保证 Godot 4.0 兼容性
static var _listeners: Array[Callable] = []

static var _locales: Dictionary = {}
static var _current_locale: String = "zh"
static var _is_initialized: bool = false

## 注册语言变更监听
static func add_listener(callback: Callable) -> void:
	if not _listeners.has(callback):
		_listeners.append(callback)

## 初始化：扫描 i18n 目录并加载所有 JSON
static func initialize() -> void:
	if _is_initialized: return
	
	var lang_files := ["zh", "en"]
	var base_path := "res://addons/ksanadock/i18n/"
	
	for lang in lang_files:
		var file_path = base_path + lang + ".json"
		if FileAccess.file_exists(file_path):
			var file = FileAccess.open(file_path, FileAccess.READ)
			var content = file.get_as_text()
			var json_data = JSON.parse_string(content)
			if json_data is Dictionary:
				_locales[lang] = json_data
	
	_is_initialized = true
	
	# 尝试从编辑器读取持久化的语言设置
	if Engine.is_editor_hint():
		var ctrl = EditorInterface.get_base_control()
		if ctrl.has_meta("ksanadock_locale"):
			_current_locale = ctrl.get_meta("ksanadock_locale")
		else:
			# 默认跟随系统
			var sys_lang = OS.get_locale_language()
			_current_locale = "zh" if sys_lang == "zh" else "en"
			ctrl.set_meta("ksanadock_locale", _current_locale)
		
		print("[KsanaDock] Localization initialized. Current locale: ", _current_locale)


## 获取翻译文本
static func get_text(section: String, key: String, default: String = "") -> String:
	if not _is_initialized:
		initialize()
		
	var lang_dict = _locales.get(_current_locale, {})
	var section_dict = lang_dict.get(section, {})
	var result = section_dict.get(key, "")
	if result == "":
		return default if default != "" else key
	return result


## 切换语言
static func set_locale(lang: String) -> void:
	if lang == _current_locale: return
	_current_locale = lang
	
	if Engine.is_editor_hint():
		EditorInterface.get_base_control().set_meta("ksanadock_locale", lang)
	
	# 手动通知所有监听者
	var to_remove = []
	for listener in _listeners:
		if listener.is_valid():
			listener.call(lang)
		else:
			to_remove.append(listener)
	
	# 清理无效的监听者（已释放的节点）
	for r in to_remove:
		_listeners.erase(r)


static func get_locale() -> String:
	return _current_locale
