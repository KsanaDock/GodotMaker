## XRInterface <- RefCounted

**Props:**
- ar_is_anchor_detection_enabled: bool = false
- environment_blend_mode: int = 0
- interface_is_primary: bool = false
- xr_play_area_mode: int = 0

**Methods:**
- get_camera_feed_id() -> int
- get_capabilities() -> int
- get_name() -> StringName
- get_play_area() -> PackedVector3Array
- get_projection_for_view(view: int, aspect: float, near: float, far: float) -> Projection
- get_render_target_size() -> Vector2
- get_supported_environment_blend_modes() -> Array
- get_system_info() -> Dictionary
- get_tracking_status() -> int
- get_transform_for_view(view: int, cam_transform: Transform3D) -> Transform3D
- get_view_count() -> int
- initialize() -> bool
- is_initialized() -> bool
- is_passthrough_enabled() -> bool
- is_passthrough_supported() -> bool
- set_environment_blend_mode(mode: int) -> bool
- set_play_area_mode(mode: int) -> bool
- start_passthrough() -> bool
- stop_passthrough()
- supports_play_area_mode(mode: int) -> bool
- trigger_haptic_pulse(action_name: String, tracker_name: StringName, frequency: float, amplitude: float, duration_sec: float, delay_sec: float)
- uninitialize()

**Signals:**
- play_area_changed(mode: int)
