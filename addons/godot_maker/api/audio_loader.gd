@tool
class_name KAudioLoader
extends RefCounted
## GodotMaker 音频加载器 — 异步下载并播放音频

static var _cache: Dictionary = {} # URL -> file_path
static var _player: AudioStreamPlayer = null
static var _counter: int = 0


## 获取或创建全局播放器
static func _get_player() -> AudioStreamPlayer:
	if is_instance_valid(_player):
		return _player
	_player = AudioStreamPlayer.new()
	_player.name = "GodotMakerAudioPlayer"
	EditorInterface.get_base_control().add_child(_player)
	return _player


## 播放指定 URL 的音频
static func play(url: String) -> void:
	var player := _get_player()
	
	# 如果正在播放同一个 URL，则暂停
	if player.playing and player.has_meta("current_url") and player.get_meta("current_url") == url:
		player.stop()
		return
		
	player.stop()
	player.set_meta("current_url", url)
	
	var optimized_url: String = KImageLoader.get_optimized_url(url)
	
	# 检查缓存（已下载的临时文件路径）
	if _cache.has(optimized_url):
		var cached_path: String = _cache[optimized_url]
		_play_file(cached_path, url)
		return
	
	# 异步下载
	var http := HTTPRequest.new()
	http.timeout = 60.0
	EditorInterface.get_base_control().add_child(http)
	
	http.request_completed.connect(func(result: int, code: int, headers: PackedStringArray, body: PackedByteArray):
		http.queue_free()
		
		if result != HTTPRequest.RESULT_SUCCESS or code != 200 or body.size() == 0:
			push_warning("[GodotMaker] Audio download failed (result=%d, code=%d, size=%d) URL: %s" % [result, code, body.size(), optimized_url])
			return
		
		# 检测是否下载到了 HTML (常见于代理或 CDN 错误页)
		if body.size() > 10:
			var head := body.slice(0, 10).get_string_from_ascii().to_lower()
			if "<!doctype" in head or "<html" in head:
				push_warning("[GodotMaker] Downloaded content is HTML, not audio. URL: %s" % optimized_url)
				return
		
		# 检测格式并保存到临时文件
		var ext: String = "mp3"
		# 检查 Content-Type header
		for h in headers:
			var lower_h: String = h.to_lower()
			if lower_h.begins_with("content-type:"):
				if "wav" in lower_h: ext = "wav"
				elif "ogg" in lower_h: ext = "ogg"
				elif "mpeg" in lower_h or "mp3" in lower_h: ext = "mp3"
		
		# 也检查 URL 后缀
		var url_lower: String = optimized_url.to_lower()
		if ".wav" in url_lower: ext = "wav"
		elif ".ogg" in url_lower: ext = "ogg"
		
		# 保存到临时文件
		_counter += 1
		var tmp_path: String = "user://ksanadock_audio_%d.%s" % [_counter, ext]
		var file := FileAccess.open(tmp_path, FileAccess.WRITE)
		if not file:
			push_error("[GodotMaker] Cannot write temp audio file: %s" % tmp_path)
			return
		file.store_buffer(body)
		file.close()
		
		_cache[optimized_url] = tmp_path
		
		# 确保用户没有在下载期间切换到其他曲目
		if player.has_meta("current_url") and player.get_meta("current_url") == url:
			_play_file(tmp_path, url)
	)
	
	http.request(optimized_url)


## 从临时文件播放
static func _play_file(path: String, url: String) -> void:
	var player := _get_player()
	var stream: AudioStream = null
	
	var data := FileAccess.get_file_as_bytes(path)
	if data.size() == 0:
		push_warning("[GodotMaker] Audio file is empty: %s" % path)
		return
		
	# 1. 首先通过内容探测格式（Magic Bytes）
	var is_wav := false
	var is_ogg := false
	var is_mp3 := false
	
	if data.size() > 12:
		var head_riff := data.slice(0, 4).get_string_from_ascii()
		var head_wave := data.slice(8, 12).get_string_from_ascii()
		if head_riff == "RIFF" and head_wave == "WAVE":
			is_wav = true
		
	if not is_wav and data.size() > 4:
		var head_ogg := data.slice(0, 4).get_string_from_ascii()
		if head_ogg == "OggS":
			is_ogg = true
			
	# 如果是 MP3，通常以 ID3 开头或 0xFF 开头
	if not is_wav and not is_ogg and data.size() > 3:
		if data.slice(0, 3).get_string_from_ascii() == "ID3" or data[0] == 0xFF:
			is_mp3 = true

	# 2. 根据探测结果选择加载器（无视后缀名）
	if is_wav:
		if path.ends_with(".mp3"):
			print("[GodotMaker] Detected WAV content in .mp3 file, using WAV loader.")
		stream = _load_wav_from_buffer(data)
	elif is_ogg:
		stream = AudioStreamOggVorbis.load_from_file(path)
	elif is_mp3 or path.ends_with(".mp3"):
		var mp3 := AudioStreamMP3.new()
		mp3.data = data
		stream = mp3
	elif path.ends_with(".wav"):
		# 后缀是 wav 但没探测到 RIFF？尝试万能加载或作为 MP3 尝试
		stream = _load_wav_from_buffer(data)
		if not stream:
			var mp3 := AudioStreamMP3.new()
			mp3.data = data
			stream = mp3
	
	if stream:
		player.stream = stream
		player.play()
	else:
		push_warning("[GodotMaker] Could not create audio stream from: %s (Size: %d)" % [path, data.size()])


## 手动解析 WAV Buffer (支持标准导出格式)
static func _load_wav_from_buffer(bytes: PackedByteArray) -> AudioStreamWAV:
	if bytes.size() < 44: return null
	
	var wav := AudioStreamWAV.new()
	
	# Parse fmt chunk
	var format := bytes.decode_u16(20)
	var channels := bytes.decode_u16(22)
	var mix_rate := bytes.decode_u32(24)
	var bits := bytes.decode_u16(34)
	
	if format != 1: # Only PCM supported
		push_error("[GodotMaker] Only PCM WAV is supported.")
		return null
		
	wav.mix_rate = mix_rate
	wav.stereo = (channels == 2)
	
	if bits == 8:
		wav.format = AudioStreamWAV.FORMAT_8_BITS
	elif bits == 16:
		wav.format = AudioStreamWAV.FORMAT_16_BITS
	else:
		push_error("[GodotMaker] Unsupported WAV bits per sample: %d" % bits)
		return null
		
	# Find data chunk (WAV chunks can be in any order, though 'data' is usually after 'fmt ')
	var pos := 12 # Start after RIFF header
	while pos + 8 < bytes.size():
		var chunk_id := bytes.slice(pos, pos + 4).get_string_from_ascii()
		var chunk_size := bytes.decode_u32(pos + 4)
		if chunk_id == "data":
			wav.data = bytes.slice(pos + 8, pos + 8 + chunk_size)
			return wav
		pos += 8 + chunk_size
		if chunk_size % 2 == 1: pos += 1 # RIFF chunks are padded to 2 bytes
		
	return null


## 停止播放
static func stop() -> void:
	if is_instance_valid(_player):
		_player.stop()
		_player.set_meta("current_url", "")


## 当前是否在播放指定 URL
static func is_playing_url(url: String) -> bool:
	if not is_instance_valid(_player): return false
	if not _player.playing: return false
	return _player.has_meta("current_url") and _player.get_meta("current_url") == url


## 清理
static func cleanup() -> void:
	if is_instance_valid(_player):
		_player.stop()
		_player.queue_free()
		_player = null
	# 清理临时文件
	for key in _cache:
		var path: String = _cache[key]
		if FileAccess.file_exists(path):
			DirAccess.remove_absolute(path)
	_cache.clear()
