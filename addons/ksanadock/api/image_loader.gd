@tool
class_name KImageLoader
extends RefCounted
## KsanaDock 图片加载器 — 处理异步下载与缓存

# 代理配置
const PROXY_HOST := "https://assets.ksanadock.com"
const SUPABASE_HOST := "supabase.co"

static var _cache: Dictionary = {} # URL -> Texture


## 获取优化后的 URL
static func get_optimized_url(url: String) -> String:
	if url == "" or not url.begins_with("http"):
		return url
		
	if SUPABASE_HOST in url and "/storage/v1/object/public" in url:
		var parts := url.split(SUPABASE_HOST)
		if parts.size() > 1:
			return PROXY_HOST + parts[1]
	return url


## 异步加载纹理
static func load_texture(url: String, callback: Callable) -> void:
	var optimized_url := get_optimized_url(url)
	
	if _cache.has(optimized_url):
		callback.call(_cache[optimized_url])
		return
		
	var http := HTTPRequest.new()
	# 大尺寸 PNG 可能大于默认 body_size_limit，设置为 16MB
	http.download_chunk_size = 65536
	http.timeout = 30.0
	EditorInterface.get_base_control().add_child(http)
	
	http.request_completed.connect(func(result: int, code: int, _headers: PackedStringArray, body: PackedByteArray):
		http.queue_free()
		
		if result != HTTPRequest.RESULT_SUCCESS:
			if result == HTTPRequest.RESULT_CANT_CONNECT or result == HTTPRequest.RESULT_TIMEOUT or result == 4:
				# 降级普通网络错误（如连接失败、超时或常规 HTTP 错误）为普通日志，避免在网络不稳定时弹出大量黄色报警
				print("[KsanaDock] Image download skipped (result=%d, possibly network/SSL issue) for URL: %s" % [result, optimized_url])
			else:
				push_warning("[KsanaDock] Image download failed (result=%d) for URL: %s" % [result, optimized_url])
			callback.call(null)
			return
		
		if code != 200:
			push_warning("[KsanaDock] Image HTTP %d for URL: %s" % [code, optimized_url])
			callback.call(null)
			return
		
		if body.size() > 10:
			var head := body.slice(0, 10).get_string_from_ascii().to_lower()
			if "<!doctype" in head or "<html" in head:
				push_warning("[KsanaDock] Downloaded content is HTML, not an image. URL: %s" % optimized_url)
				callback.call(null)
				return
				
		var format := _identify_image_format(body)
		if format == ImageFormat.NONE:
			push_warning("[KsanaDock] Downloaded data is not a recognizable image format. URL: %s" % optimized_url)
			callback.call(null)
			return
			
		var image := Image.new()
		var error: Error = OK
		
		match format:
			ImageFormat.PNG:
				error = image.load_png_from_buffer(body)
			ImageFormat.JPG:
				error = image.load_jpg_from_buffer(body)
			ImageFormat.WEBP:
				error = image.load_webp_from_buffer(body)
			ImageFormat.GIF:
				# Godot 暂时没有内置 load_gif_from_buffer，如果命中可以尝试报错或静默处理
				push_warning("[KsanaDock] GIF format detected but not currently supported for direct buffer loading. URL: %s" % optimized_url)
				callback.call(null)
				return
			
		if error != OK:
			push_error("[KsanaDock] Failed to decode image (format=%d, error=%d) URL: %s" % [format, error, optimized_url])
			callback.call(null)
			return
			
		var texture := ImageTexture.create_from_image(image)
		_cache[optimized_url] = texture
		callback.call(texture)
	)
	
	var err := http.request(optimized_url)
	if err != OK:
		push_error("[KsanaDock] Failed to start image request (error=%d) URL: %s" % [err, optimized_url])
		http.queue_free()
		callback.call(null)


enum ImageFormat { NONE, PNG, JPG, WEBP, GIF }


## 识别 Buffer 属于哪种图片头特征
static func _identify_image_format(body: PackedByteArray) -> ImageFormat:
	if body.size() < 12: return ImageFormat.NONE
	
	# PNG: 89 50 4E 47
	if body[0] == 0x89 and body[1] == 0x50 and body[2] == 0x4E and body[3] == 0x47:
		return ImageFormat.PNG
		
	# JPEG: FF D8 FF
	if body[0] == 0xFF and body[1] == 0xD8 and body[2] == 0xFF:
		return ImageFormat.JPG
		
	# WebP: RIFF...WEBP (52 49 46 46 ... 57 45 42 50)
	if body[0] == 0x52 and body[1] == 0x49 and body[2] == 0x46 and body[3] == 0x46:
		var web_id := body.slice(8, 12).get_string_from_ascii()
		if web_id == "WEBP":
			return ImageFormat.WEBP
			
	# GIF: GIF8
	var gif_id := body.slice(0, 4).get_string_from_ascii()
	if gif_id == "GIF8":
		return ImageFormat.GIF
		
	return ImageFormat.NONE
