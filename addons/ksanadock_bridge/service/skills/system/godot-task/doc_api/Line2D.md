## Line2D <- Node2D

**Props:**
- antialiased: bool = false
- begin_cap_mode: int = 0
- closed: bool = false
- default_color: Color = Color(1, 1, 1, 1)
- end_cap_mode: int = 0
- gradient: Gradient
- joint_mode: int = 0
- points: PackedVector2Array = PackedVector2Array()
- round_precision: int = 8
- sharp_limit: float = 2.0
- texture: Texture2D
- texture_mode: int = 0
- width: float = 10.0
- width_curve: Curve

**Methods:**
- add_point(position: Vector2, index: int = -1)
- clear_points()
- get_point_count() -> int
- get_point_position(index: int) -> Vector2
- remove_point(index: int)
- set_point_position(index: int, position: Vector2)
