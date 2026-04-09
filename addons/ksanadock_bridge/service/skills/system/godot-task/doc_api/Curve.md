## Curve <- Resource

**Props:**
- bake_resolution: int = 100
- max_domain: float = 1.0
- max_value: float = 1.0
- min_domain: float = 0.0
- min_value: float = 0.0
- point_count: int = 0
- point_{index}/left_mode: int = 0
- point_{index}/left_tangent: float = 0.0
- point_{index}/position: Vector2 = Vector2(0, 0)
- point_{index}/right_mode: int = 0
- point_{index}/right_tangent: float = 0.0

**Methods:**
- add_point(position: Vector2, left_tangent: float = 0, right_tangent: float = 0, left_mode: int = 0, right_mode: int = 0) -> int
- bake()
- clean_dupes()
- clear_points()
- get_domain_range() -> float
- get_point_left_mode(index: int) -> int
- get_point_left_tangent(index: int) -> float
- get_point_position(index: int) -> Vector2
- get_point_right_mode(index: int) -> int
- get_point_right_tangent(index: int) -> float
- get_value_range() -> float
- remove_point(index: int)
- sample(offset: float) -> float
- sample_baked(offset: float) -> float
- set_point_left_mode(index: int, mode: int)
- set_point_left_tangent(index: int, tangent: float)
- set_point_offset(index: int, offset: float) -> int
- set_point_right_mode(index: int, mode: int)
- set_point_right_tangent(index: int, tangent: float)
- set_point_value(index: int, y: float)

**Signals:**
- domain_changed
- range_changed
