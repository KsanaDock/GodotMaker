## AudioStreamPlayer2D <- Node2D

**Props:**
- area_mask: int = 1
- attenuation: float = 1.0
- autoplay: bool = false
- bus: StringName = &"Master"
- max_distance: float = 2000.0
- max_polyphony: int = 1
- panning_strength: float = 1.0
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
