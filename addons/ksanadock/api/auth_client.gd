@tool
class_name KAuthClient
extends RefCounted
## KsanaDock 认证客户端 — 支持真实 Supabase REST API 调用

signal login_success(token: String, user: Dictionary)
signal login_failed(error: String)
signal logged_out

# Supabase 配置（从 .env.local 提取）
const SUPABASE_URL := "https://tyefgyieezrsyhzjutmv.supabase.co"
const SUPABASE_ANON_KEY := "sb_publishable_BAYzIdIagPSRjjd6LVBfjw_YgCoA9fr"

const SETTINGS_TOKEN_KEY := "ksanadock/auth_token"
const SETTINGS_REFRESH_TOKEN_KEY := "ksanadock/refresh_token"
const SETTINGS_USER_KEY := "ksanadock/user_data"

var _token: String = ""
var _refresh_token: String = ""
var _user: Dictionary = {}


func is_logged_in() -> bool:
	if _token != "": return true
	var es := EditorInterface.get_editor_settings()
	
	if es.has_setting(SETTINGS_TOKEN_KEY):
		_token = es.get_setting(SETTINGS_TOKEN_KEY)
	
	if es.has_setting(SETTINGS_REFRESH_TOKEN_KEY):
		_refresh_token = es.get_setting(SETTINGS_REFRESH_TOKEN_KEY)
		
	if _token != "" or _refresh_token != "":
		if es.has_setting(SETTINGS_USER_KEY):
			_user = es.get_setting(SETTINGS_USER_KEY)
		return true
	return false


func get_token() -> String: return _token
func get_user() -> Dictionary: return _user


func login(email: String, password: String) -> void:
	var url: String = SUPABASE_URL + "/auth/v1/token?grant_type=password"
	var headers: PackedStringArray = [
		"apikey: " + SUPABASE_ANON_KEY,
		"Content-Type: application/json"
	]
	var body: String = JSON.stringify({
		"email": email,
		"password": password
	})

	var http := HTTPRequest.new()
	EditorInterface.get_base_control().add_child(http)
	http.request_completed.connect(func(r, c, h, b): _on_login_completed(r, c, h, b, http))
	http.request(url, headers, HTTPClient.METHOD_POST, body)


func _on_login_completed(result: int, code: int, _headers: PackedStringArray, body: PackedByteArray, http: HTTPRequest) -> void:
	http.queue_free()
	if result != HTTPRequest.RESULT_SUCCESS:
		login_failed.emit("Network error. Please check your connection.")
		return

	var json = JSON.parse_string(body.get_string_from_utf8())
	if code != 200:
		var err_msg = json.get("error_description", json.get("error", "Unknown error"))
		login_failed.emit(err_msg)
		return

	_token = json.get("access_token", "")
	_refresh_token = json.get("refresh_token", "")
	var user_data = json.get("user", {})

	# 登录成功后，我们需要拉取真实的 Profile (Nickname, Credits, etc)
	_fetch_profile(user_data)


func _fetch_profile(auth_user: Dictionary) -> void:
	var user_id: String = str(auth_user.get("id", ""))
	var url: String = SUPABASE_URL + "/rest/v1/profiles?id=eq." + user_id + "&select=*"
	var headers: PackedStringArray = [
		"apikey: " + SUPABASE_ANON_KEY,
		"Authorization: Bearer " + _token,
		"Content-Type: application/json"
	]

	var http := HTTPRequest.new()
	EditorInterface.get_base_control().add_child(http)
	http.request_completed.connect(func(r, c, h, b): _on_profile_completed(r, c, h, b, http, auth_user))
	http.request(url, headers, HTTPClient.METHOD_GET)


func _on_profile_completed(result: int, code: int, _headers: PackedStringArray, body: PackedByteArray, http: HTTPRequest, auth_user: Dictionary) -> void:
	http.queue_free()
	var profile := {}
	if result == HTTPRequest.RESULT_SUCCESS and code == 200:
		var list = JSON.parse_string(body.get_string_from_utf8())
		if list and list.size() > 0:
			profile = list[0]

	# 合并 Auth 数据和 Profile 数据
	_user = {
		"id": auth_user.get("id"),
		"email": auth_user.get("email"),
		"nickname": profile.get("nickname", auth_user.get("email").split("@")[0]),
		"bio": profile.get("bio", ""),
		"plan": profile.get("plan", "free"),
		"credits": int(profile.get("credits", 0)),
		"avatar_url": profile.get("avatar_url", ""),
	}

	# 持久化
	var es := EditorInterface.get_editor_settings()
	es.set_setting(SETTINGS_TOKEN_KEY, _token)
	es.set_setting(SETTINGS_REFRESH_TOKEN_KEY, _refresh_token)
	es.set_setting(SETTINGS_USER_KEY, _user)

	login_success.emit(_token, _user)


## 尝试使用 refresh_token 刷新会话
func refresh_session() -> void:
	if _refresh_token == "":
		var es := EditorInterface.get_editor_settings()
		if es.has_setting(SETTINGS_REFRESH_TOKEN_KEY):
			_refresh_token = es.get_setting(SETTINGS_REFRESH_TOKEN_KEY)
	
	if _refresh_token == "":
		login_failed.emit("No refresh token available.")
		return
		
	var url: String = SUPABASE_URL + "/auth/v1/token?grant_type=refresh_token"
	var headers: PackedStringArray = [
		"apikey: " + SUPABASE_ANON_KEY,
		"Content-Type: application/json"
	]
	var body: String = JSON.stringify({
		"refresh_token": _refresh_token
	})

	var http := HTTPRequest.new()
	EditorInterface.get_base_control().add_child(http)
	http.request_completed.connect(func(r, c, h, b): _on_login_completed(r, c, h, b, http))
	http.request(url, headers, HTTPClient.METHOD_POST, body)


func logout() -> void:
	_token = ""
	_refresh_token = ""
	_user = {}
	var es := EditorInterface.get_editor_settings()
	if es.has_setting(SETTINGS_TOKEN_KEY): es.set_setting(SETTINGS_TOKEN_KEY, "")
	if es.has_setting(SETTINGS_REFRESH_TOKEN_KEY): es.set_setting(SETTINGS_REFRESH_TOKEN_KEY, "")
	if es.has_setting(SETTINGS_USER_KEY): es.set_setting(SETTINGS_USER_KEY, {})
	logged_out.emit()
