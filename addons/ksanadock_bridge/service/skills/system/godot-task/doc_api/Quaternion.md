## Quaternion

**Props:**
- w: float = 1.0
- x: float = 0.0
- y: float = 0.0
- z: float = 0.0

**Ctors:**
- Quaternion()
- Quaternion(from: Quaternion)
- Quaternion(arc_from: Vector3, arc_to: Vector3)
- Quaternion(axis: Vector3, angle: float)
- Quaternion(from: Basis)
- Quaternion(x: float, y: float, z: float, w: float)

**Methods:**
- angle_to(to: Quaternion) -> float
- dot(with: Quaternion) -> float
- exp() -> Quaternion
- from_euler(euler: Vector3) -> Quaternion
- get_angle() -> float
- get_axis() -> Vector3
- get_euler(order: int = 2) -> Vector3
- inverse() -> Quaternion
- is_equal_approx(to: Quaternion) -> bool
- is_finite() -> bool
- is_normalized() -> bool
- length() -> float
- length_squared() -> float
- log() -> Quaternion
- normalized() -> Quaternion
- slerp(to: Quaternion, weight: float) -> Quaternion
- slerpni(to: Quaternion, weight: float) -> Quaternion
- spherical_cubic_interpolate(b: Quaternion, pre_a: Quaternion, post_b: Quaternion, weight: float) -> Quaternion
- spherical_cubic_interpolate_in_time(b: Quaternion, pre_a: Quaternion, post_b: Quaternion, weight: float, b_t: float, pre_a_t: float, post_b_t: float) -> Quaternion

**Operators:**
- operator !=
- operator *
- operator *
- operator *
- operator *
- operator +
- operator -
- operator /
- operator /
- operator ==
- operator []
- operator unary+
- operator unary-
