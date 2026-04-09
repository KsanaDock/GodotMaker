## AudioEffectCapture <- AudioEffect

**Props:**
- buffer_length: float = 0.1

**Methods:**
- can_get_buffer(frames: int) -> bool
- clear_buffer()
- get_buffer(frames: int) -> PackedVector2Array
- get_buffer_length_frames() -> int
- get_discarded_frames() -> int
- get_frames_available() -> int
- get_pushed_frames() -> int
