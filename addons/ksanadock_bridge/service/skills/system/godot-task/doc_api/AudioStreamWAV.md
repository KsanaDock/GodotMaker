## AudioStreamWAV <- AudioStream

**Props:**
- data: PackedByteArray = PackedByteArray()
- format: int = 0
- loop_begin: int = 0
- loop_end: int = 0
- loop_mode: int = 0
- mix_rate: int = 44100
- stereo: bool = false
- tags: Dictionary = {}

**Methods:**
- load_from_buffer(stream_data: PackedByteArray, options: Dictionary = {}) -> AudioStreamWAV
- load_from_file(path: String, options: Dictionary = {}) -> AudioStreamWAV
- save_to_wav(path: String) -> int
