## Vector4i

**Props:**
- w: int = 0
- x: int = 0
- y: int = 0
- z: int = 0

**Ctors:**
- Vector4i()
- Vector4i(from: Vector4i)
- Vector4i(from: Vector4)
- Vector4i(x: int, y: int, z: int, w: int)

**Methods:**
- abs() -> Vector4i
- clamp(min: Vector4i, max: Vector4i) -> Vector4i
- clampi(min: int, max: int) -> Vector4i
- distance_squared_to(to: Vector4i) -> int
- distance_to(to: Vector4i) -> float
- length() -> float
- length_squared() -> int
- max(with: Vector4i) -> Vector4i
- max_axis_index() -> int
- maxi(with: int) -> Vector4i
- min(with: Vector4i) -> Vector4i
- min_axis_index() -> int
- mini(with: int) -> Vector4i
- sign() -> Vector4i
- snapped(step: Vector4i) -> Vector4i
- snappedi(step: int) -> Vector4i

**Operators:**
- operator !=
- operator %
- operator %
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
