## AnimatedSprite2D <- Node2D

**Props:**
- animation: StringName = &"default"
- autoplay: String = ""
- centered: bool = true
- flip_h: bool = false
- flip_v: bool = false
- frame: int = 0
- frame_progress: float = 0.0
- offset: Vector2 = Vector2(0, 0)
- speed_scale: float = 1.0
- sprite_frames: SpriteFrames

**Methods:**
- get_playing_speed() -> float
- is_playing() -> bool
- pause()
- play(name: StringName = &"", custom_speed: float = 1.0, from_end: bool = false)
- play_backwards(name: StringName = &"")
- set_frame_and_progress(frame: int, progress: float)
- stop()

**Signals:**
- animation_changed
- animation_finished
- animation_looped
- frame_changed
- sprite_frames_changed
