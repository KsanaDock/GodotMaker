## AABB

**Props:**
- end: Vector3 = Vector3(0, 0, 0)
- position: Vector3 = Vector3(0, 0, 0)
- size: Vector3 = Vector3(0, 0, 0)

**Ctors:**
- AABB()
- AABB(from: AABB)
- AABB(position: Vector3, size: Vector3)

**Methods:**
- abs() -> AABB
- encloses(with: AABB) -> bool
- expand(to_point: Vector3) -> AABB
- get_center() -> Vector3
- get_endpoint(idx: int) -> Vector3
- get_longest_axis() -> Vector3
- get_longest_axis_index() -> int
- get_longest_axis_size() -> float
- get_shortest_axis() -> Vector3
- get_shortest_axis_index() -> int
- get_shortest_axis_size() -> float
- get_support(direction: Vector3) -> Vector3
- get_volume() -> float
- grow(by: float) -> AABB
- has_point(point: Vector3) -> bool
- has_surface() -> bool
- has_volume() -> bool
- intersection(with: AABB) -> AABB
- intersects(with: AABB) -> bool
- intersects_plane(plane: Plane) -> bool
- intersects_ray(from: Vector3, dir: Vector3) -> Variant
- intersects_segment(from: Vector3, to: Vector3) -> Variant
- is_equal_approx(aabb: AABB) -> bool
- is_finite() -> bool
- merge(with: AABB) -> AABB

**Operators:**
- operator !=
- operator *
- operator ==
