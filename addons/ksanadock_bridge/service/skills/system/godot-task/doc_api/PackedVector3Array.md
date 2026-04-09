## PackedVector3Array

**Ctors:**
- PackedVector3Array()
- PackedVector3Array(from: PackedVector3Array)
- PackedVector3Array(from: Array)

**Methods:**
- append(value: Vector3) -> bool
- append_array(array: PackedVector3Array)
- bsearch(value: Vector3, before: bool = true) -> int
- clear()
- count(value: Vector3) -> int
- duplicate() -> PackedVector3Array
- erase(value: Vector3) -> bool
- fill(value: Vector3)
- find(value: Vector3, from: int = 0) -> int
- get(index: int) -> Vector3
- has(value: Vector3) -> bool
- insert(at_index: int, value: Vector3) -> int
- is_empty() -> bool
- push_back(value: Vector3) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: Vector3, from: int = -1) -> int
- set(index: int, value: Vector3)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedVector3Array
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator *
- operator +
- operator ==
- operator []
