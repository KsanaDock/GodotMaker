## PackedVector4Array

**Ctors:**
- PackedVector4Array()
- PackedVector4Array(from: PackedVector4Array)
- PackedVector4Array(from: Array)

**Methods:**
- append(value: Vector4) -> bool
- append_array(array: PackedVector4Array)
- bsearch(value: Vector4, before: bool = true) -> int
- clear()
- count(value: Vector4) -> int
- duplicate() -> PackedVector4Array
- erase(value: Vector4) -> bool
- fill(value: Vector4)
- find(value: Vector4, from: int = 0) -> int
- get(index: int) -> Vector4
- has(value: Vector4) -> bool
- insert(at_index: int, value: Vector4) -> int
- is_empty() -> bool
- push_back(value: Vector4) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: Vector4, from: int = -1) -> int
- set(index: int, value: Vector4)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedVector4Array
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator +
- operator ==
- operator []
