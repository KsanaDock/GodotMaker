## AudioStreamPlayer <- Node

**Props:**
- autoplay: bool = false
- bus: StringName = &"Master"
- max_polyphony: int = 1
- mix_target: int = 0
- pitch_scale: float = 1.0
- playback_type: int = 0
- playing: bool = false
- stream: AudioStream
- stream_paused: bool = false
- volume_db: float = 0.0
- volume_linear: float

**Methods:**
- get_playback_position() -> float
- get_stream_playback() -> AudioStreamPlayback
- has_stream_playback() -> bool
- play(from_position: float = 0.0)
- seek(to_position: float)
- stop()

**Signals:**
- finished
