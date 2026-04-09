## Vector2i

**Props:**
- x: int = 0
- y: int = 0

**Ctors:**
- Vector2i()
- Vector2i(from: Vector2i)
- Vector2i(from: Vector2)
- Vector2i(x: int, y: int)

**Methods:**
- abs() -> Vector2i
- aspect() -> float
- clamp(min: Vector2i, max: Vector2i) -> Vector2i
- clampi(min: int, max: int) -> Vector2i
- distance_squared_to(to: Vector2i) -> int
- distance_to(to: Vector2i) -> float
- length() -> float
- length_squared() -> int
- max(with: Vector2i) -> Vector2i
- max_axis_index() -> int
- maxi(with: int) -> Vector2i
- min(with: Vector2i) -> Vector2i
- min_axis_index() -> int
- mini(with: int) -> Vector2i
- sign() -> Vector2i
- snapped(step: Vector2i) -> Vector2i
- snappedi(step: int) -> Vector2i

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
