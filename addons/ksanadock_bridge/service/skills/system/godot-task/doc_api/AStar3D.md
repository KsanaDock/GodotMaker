## AStar3D <- RefCounted

**Props:**
- neighbor_filter_enabled: bool = false

**Methods:**
- add_point(id: int, position: Vector3, weight_scale: float = 1.0)
- are_points_connected(id: int, to_id: int, bidirectional: bool = true) -> bool
- clear()
- connect_points(id: int, to_id: int, bidirectional: bool = true)
- disconnect_points(id: int, to_id: int, bidirectional: bool = true)
- get_available_point_id() -> int
- get_closest_point(to_position: Vector3, include_disabled: bool = false) -> int
- get_closest_position_in_segment(to_position: Vector3) -> Vector3
- get_id_path(from_id: int, to_id: int, allow_partial_path: bool = false) -> PackedInt64Array
- get_point_capacity() -> int
- get_point_connections(id: int) -> PackedInt64Array
- get_point_count() -> int
- get_point_ids() -> PackedInt64Array
- get_point_path(from_id: int, to_id: int, allow_partial_path: bool = false) -> PackedVector3Array
- get_point_position(id: int) -> Vector3
- get_point_weight_scale(id: int) -> float
- has_point(id: int) -> bool
- is_point_disabled(id: int) -> bool
- remove_point(id: int)
- reserve_space(num_nodes: int)
- set_point_disabled(id: int, disabled: bool = true)
- set_point_position(id: int, position: Vector3)
- set_point_weight_scale(id: int, weight_scale: float)
