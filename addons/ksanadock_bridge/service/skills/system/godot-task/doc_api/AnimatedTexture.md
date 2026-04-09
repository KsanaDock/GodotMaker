## AnimatedTexture <- Texture2D

**Props:**
- current_frame: int
- frames: int = 1
- one_shot: bool = false
- pause: bool = false
- resource_local_to_scene: bool = false
- speed_scale: float = 1.0

**Methods:**
- get_frame_duration(frame: int) -> float
- get_frame_texture(frame: int) -> Texture2D
- set_frame_duration(frame: int, duration: float)
- set_frame_texture(frame: int, texture: Texture2D)
