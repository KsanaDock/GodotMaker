## Rect2i

**Props:**
- end: Vector2i = Vector2i(0, 0)
- position: Vector2i = Vector2i(0, 0)
- size: Vector2i = Vector2i(0, 0)

**Ctors:**
- Rect2i()
- Rect2i(from: Rect2i)
- Rect2i(from: Rect2)
- Rect2i(position: Vector2i, size: Vector2i)
- Rect2i(x: int, y: int, width: int, height: int)

**Methods:**
- abs() -> Rect2i
- encloses(b: Rect2i) -> bool
- expand(to: Vector2i) -> Rect2i
- get_area() -> int
- get_center() -> Vector2i
- grow(amount: int) -> Rect2i
- grow_individual(left: int, top: int, right: int, bottom: int) -> Rect2i
- grow_side(side: int, amount: int) -> Rect2i
- has_area() -> bool
- has_point(point: Vector2i) -> bool
- intersection(b: Rect2i) -> Rect2i
- intersects(b: Rect2i) -> bool
- merge(b: Rect2i) -> Rect2i

**Operators:**
- operator !=
- operator ==
