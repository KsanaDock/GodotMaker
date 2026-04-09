## PackedVector2Array

**Ctors:**
- PackedVector2Array()
- PackedVector2Array(from: PackedVector2Array)
- PackedVector2Array(from: Array)

**Methods:**
- append(value: Vector2) -> bool
- append_array(array: PackedVector2Array)
- bsearch(value: Vector2, before: bool = true) -> int
- clear()
- count(value: Vector2) -> int
- duplicate() -> PackedVector2Array
- erase(value: Vector2) -> bool
- fill(value: Vector2)
- find(value: Vector2, from: int = 0) -> int
- get(index: int) -> Vector2
- has(value: Vector2) -> bool
- insert(at_index: int, value: Vector2) -> int
- is_empty() -> bool
- push_back(value: Vector2) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: Vector2, from: int = -1) -> int
- set(index: int, value: Vector2)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedVector2Array
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator *
- operator +
- operator ==
- operator []
