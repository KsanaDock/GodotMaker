## AStarGrid2D <- RefCounted

**Props:**
- cell_shape: int = 0
- cell_size: Vector2 = Vector2(1, 1)
- default_compute_heuristic: int = 0
- default_estimate_heuristic: int = 0
- diagonal_mode: int = 0
- jumping_enabled: bool = false
- offset: Vector2 = Vector2(0, 0)
- region: Rect2i = Rect2i(0, 0, 0, 0)
- size: Vector2i = Vector2i(0, 0)

**Methods:**
- clear()
- fill_solid_region(region: Rect2i, solid: bool = true)
- fill_weight_scale_region(region: Rect2i, weight_scale: float)
- get_id_path(from_id: Vector2i, to_id: Vector2i, allow_partial_path: bool = false) -> Vector2i[]
- get_point_data_in_region(region: Rect2i) -> Dictionary[]
- get_point_path(from_id: Vector2i, to_id: Vector2i, allow_partial_path: bool = false) -> PackedVector2Array
- get_point_position(id: Vector2i) -> Vector2
- get_point_weight_scale(id: Vector2i) -> float
- is_dirty() -> bool
- is_in_bounds(x: int, y: int) -> bool
- is_in_boundsv(id: Vector2i) -> bool
- is_point_solid(id: Vector2i) -> bool
- set_point_solid(id: Vector2i, solid: bool = true)
- set_point_weight_scale(id: Vector2i, weight_scale: float)
- update()
