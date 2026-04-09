@tool
class_name KAssetClient
extends RefCounted
## KsanaDock 资产客户端 — 对接 Supabase REST API

const SUPABASE_URL := "https://tyefgyieezrsyhzjutmv.supabase.co"
const SUPABASE_ANON_KEY := "sb_publishable_BAYzIdIagPSRjjd6LVBfjw_YgCoA9fr"

const TYPE_ANIMATION := "animation"
const TYPE_MAP := "map"
const TYPE_ITEM := "item"
const TYPE_MUSIC := "music"

signal assets_loaded(type: String, data: Array, total_count: int)
signal load_failed(type: String, error: String)

var _auth: KAuthClient


func _init(auth: KAuthClient = null) -> void:
	_auth = auth


func initialize(auth: KAuthClient) -> void:
	_auth = auth


## 根据类型从 Supabase 拉取资产（支持分页）
func fetch_assets(type: String, page: int = 1, page_size: int = 8) -> void:
	if not _auth or not _auth.is_logged_in():
		load_failed.emit(type, "Not logged in.")
		return

	var table_name: String = _get_table_for_type(type)
	var user_id: String = str(_auth.get_user().get("id", ""))
	
	# 注意：为了让最新创建的资产排在前面，添加 order 参数
	var url: String = SUPABASE_URL + "/rest/v1/" + table_name + "?user_id=eq." + user_id + "&select=*&order=created_at.desc"
	
	# 计算 Range 头部的 start 和 end
	var start_idx: int = (page - 1) * page_size
	var end_idx: int = start_idx + page_size - 1
	var range_str: String = "%d-%d" % [start_idx, end_idx]
	
	var headers: PackedStringArray = [
		"apikey: " + SUPABASE_ANON_KEY,
		"Authorization: Bearer " + _auth.get_token(),
		"Content-Type: application/json",
		"Range-Unit: items",
		"Range: " + range_str,
		"Prefer: count=exact"
	]

	var http := HTTPRequest.new()
	EditorInterface.get_base_control().add_child(http)
	http.request_completed.connect(func(r, c, h, b): _on_request_completed(r, c, h, b, http, type))
	http.request(url, headers, HTTPClient.METHOD_GET)


func _on_request_completed(result: int, code: int, headers: PackedStringArray, body: PackedByteArray, http: HTTPRequest, type: String) -> void:
	http.queue_free()
	
	if result != HTTPRequest.RESULT_SUCCESS:
		load_failed.emit(type, "Network error.")
		return
		
	# 解析总数 Content-Range: 0-7/15 => 15
	var total_count: int = 0
	for h in headers:
		var lower_h := h.to_lower()
		if lower_h.begins_with("content-range:"):
			# eg. "content-range: 0-7/15"
			var parts := lower_h.split("/")
			if parts.size() > 1:
				total_count = int(parts[1])
			break

	var json = JSON.parse_string(body.get_string_from_utf8())
	
	# HTTP 200 (OK) 或 HTTP 206 (Partial Content) 都算成功
	if code != 200 and code != 206:
		if code == 401 and _auth:
			# Token 过期或无效，尝试静默刷新
			_auth.refresh_session()
			load_failed.emit(type, "Session expired, refreshing...")
			return
		load_failed.emit(type, "Error %d" % code)
		return
		
	if json is Array:
		assets_loaded.emit(type, json, total_count)
	else:
		load_failed.emit(type, "Invalid data format.")


func _get_table_for_type(type: String) -> String:
	match type:
		TYPE_ANIMATION: return "character_assets"
		TYPE_MAP: return "map_assets"
		TYPE_ITEM: return "item_assets"
		TYPE_MUSIC: return "music_assets"
	return "character_assets"
