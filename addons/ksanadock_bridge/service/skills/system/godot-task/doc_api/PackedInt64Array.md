## PackedInt64Array

**Ctors:**
- PackedInt64Array()
- PackedInt64Array(from: PackedInt64Array)
- PackedInt64Array(from: Array)

**Methods:**
- append(value: int) -> bool
- append_array(array: PackedInt64Array)
- bsearch(value: int, before: bool = true) -> int
- clear()
- count(value: int) -> int
- duplicate() -> PackedInt64Array
- erase(value: int) -> bool
- fill(value: int)
- find(value: int, from: int = 0) -> int
- get(index: int) -> int
- has(value: int) -> bool
- insert(at_index: int, value: int) -> int
- is_empty() -> bool
- push_back(value: int) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: int, from: int = -1) -> int
- set(index: int, value: int)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedInt64Array
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator +
- operator ==
- operator []
