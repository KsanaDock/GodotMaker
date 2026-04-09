## Camera2D <- Node2D

**Props:**
- anchor_mode: int = 1
- custom_viewport: Node
- drag_bottom_margin: float = 0.2
- drag_horizontal_enabled: bool = false
- drag_horizontal_offset: float = 0.0
- drag_left_margin: float = 0.2
- drag_right_margin: float = 0.2
- drag_top_margin: float = 0.2
- drag_vertical_enabled: bool = false
- drag_vertical_offset: float = 0.0
- editor_draw_drag_margin: bool = false
- editor_draw_limits: bool = false
- editor_draw_screen: bool = true
- enabled: bool = true
- ignore_rotation: bool = true
- limit_bottom: int = 10000000
- limit_enabled: bool = true
- limit_left: int = -10000000
- limit_right: int = 10000000
- limit_smoothed: bool = false
- limit_top: int = -10000000
- offset: Vector2 = Vector2(0, 0)
- position_smoothing_enabled: bool = false
- position_smoothing_speed: float = 5.0
- process_callback: int = 1
- rotation_smoothing_enabled: bool = false
- rotation_smoothing_speed: float = 5.0
- zoom: Vector2 = Vector2(1, 1)

**Methods:**
- align()
- force_update_scroll()
- get_drag_margin(margin: int) -> float
- get_limit(margin: int) -> int
- get_screen_center_position() -> Vector2
- get_screen_rotation() -> float
- get_target_position() -> Vector2
- is_current() -> bool
- make_current()
- reset_smoothing()
- set_drag_margin(margin: int, drag_margin: float)
- set_limit(margin: int, limit: int)
