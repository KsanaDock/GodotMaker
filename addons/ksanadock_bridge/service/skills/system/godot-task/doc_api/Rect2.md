## Rect2

**Props:**
- end: Vector2 = Vector2(0, 0)
- position: Vector2 = Vector2(0, 0)
- size: Vector2 = Vector2(0, 0)

**Ctors:**
- Rect2()
- Rect2(from: Rect2)
- Rect2(from: Rect2i)
- Rect2(position: Vector2, size: Vector2)
- Rect2(x: float, y: float, width: float, height: float)

**Methods:**
- abs() -> Rect2
- encloses(b: Rect2) -> bool
- expand(to: Vector2) -> Rect2
- get_area() -> float
- get_center() -> Vector2
- get_support(direction: Vector2) -> Vector2
- grow(amount: float) -> Rect2
- grow_individual(left: float, top: float, right: float, bottom: float) -> Rect2
- grow_side(side: int, amount: float) -> Rect2
- has_area() -> bool
- has_point(point: Vector2) -> bool
- intersection(b: Rect2) -> Rect2
- intersects(b: Rect2, include_borders: bool = false) -> bool
- is_equal_approx(rect: Rect2) -> bool
- is_finite() -> bool
- merge(b: Rect2) -> Rect2

**Operators:**
- operator !=
- operator *
- operator ==
