## Plane

**Props:**
- d: float = 0.0
- normal: Vector3 = Vector3(0, 0, 0)
- x: float = 0.0
- y: float = 0.0
- z: float = 0.0

**Ctors:**
- Plane()
- Plane(from: Plane)
- Plane(a: float, b: float, c: float, d: float)
- Plane(normal: Vector3)
- Plane(normal: Vector3, d: float)
- Plane(normal: Vector3, point: Vector3)
- Plane(point1: Vector3, point2: Vector3, point3: Vector3)

**Methods:**
- distance_to(point: Vector3) -> float
- get_center() -> Vector3
- has_point(point: Vector3, tolerance: float = 1e-05) -> bool
- intersect_3(b: Plane, c: Plane) -> Variant
- intersects_ray(from: Vector3, dir: Vector3) -> Variant
- intersects_segment(from: Vector3, to: Vector3) -> Variant
- is_equal_approx(to_plane: Plane) -> bool
- is_finite() -> bool
- is_point_over(point: Vector3) -> bool
- normalized() -> Plane
- project(point: Vector3) -> Vector3

**Operators:**
- operator !=
- operator *
- operator ==
- operator unary+
- operator unary-
