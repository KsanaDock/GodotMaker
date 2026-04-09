## Vector3i

**Props:**
- x: int = 0
- y: int = 0
- z: int = 0

**Ctors:**
- Vector3i()
- Vector3i(from: Vector3i)
- Vector3i(from: Vector3)
- Vector3i(x: int, y: int, z: int)

**Methods:**
- abs() -> Vector3i
- clamp(min: Vector3i, max: Vector3i) -> Vector3i
- clampi(min: int, max: int) -> Vector3i
- distance_squared_to(to: Vector3i) -> int
- distance_to(to: Vector3i) -> float
- length() -> float
- length_squared() -> int
- max(with: Vector3i) -> Vector3i
- max_axis_index() -> int
- maxi(with: int) -> Vector3i
- min(with: Vector3i) -> Vector3i
- min_axis_index() -> int
- mini(with: int) -> Vector3i
- sign() -> Vector3i
- snapped(step: Vector3i) -> Vector3i
- snappedi(step: int) -> Vector3i

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
