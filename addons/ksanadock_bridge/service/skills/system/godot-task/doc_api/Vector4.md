## Vector4

**Props:**
- w: float = 0.0
- x: float = 0.0
- y: float = 0.0
- z: float = 0.0

**Ctors:**
- Vector4()
- Vector4(from: Vector4)
- Vector4(from: Vector4i)
- Vector4(x: float, y: float, z: float, w: float)

**Methods:**
- abs() -> Vector4
- ceil() -> Vector4
- clamp(min: Vector4, max: Vector4) -> Vector4
- clampf(min: float, max: float) -> Vector4
- cubic_interpolate(b: Vector4, pre_a: Vector4, post_b: Vector4, weight: float) -> Vector4
- cubic_interpolate_in_time(b: Vector4, pre_a: Vector4, post_b: Vector4, weight: float, b_t: float, pre_a_t: float, post_b_t: float) -> Vector4
- direction_to(to: Vector4) -> Vector4
- distance_squared_to(to: Vector4) -> float
- distance_to(to: Vector4) -> float
- dot(with: Vector4) -> float
- floor() -> Vector4
- inverse() -> Vector4
- is_equal_approx(to: Vector4) -> bool
- is_finite() -> bool
- is_normalized() -> bool
- is_zero_approx() -> bool
- length() -> float
- length_squared() -> float
- lerp(to: Vector4, weight: float) -> Vector4
- max(with: Vector4) -> Vector4
- max_axis_index() -> int
- maxf(with: float) -> Vector4
- min(with: Vector4) -> Vector4
- min_axis_index() -> int
- minf(with: float) -> Vector4
- normalized() -> Vector4
- posmod(mod: float) -> Vector4
- posmodv(modv: Vector4) -> Vector4
- round() -> Vector4
- sign() -> Vector4
- snapped(step: Vector4) -> Vector4
- snappedf(step: float) -> Vector4

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
- operator /
- operator <
- operator <=
- operator ==
- operator >
- operator >=
- operator []
- operator unary+
- operator unary-
