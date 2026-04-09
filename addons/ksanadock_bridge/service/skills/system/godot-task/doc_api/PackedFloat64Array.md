## PackedFloat64Array

**Ctors:**
- PackedFloat64Array()
- PackedFloat64Array(from: PackedFloat64Array)
- PackedFloat64Array(from: Array)

**Methods:**
- append(value: float) -> bool
- append_array(array: PackedFloat64Array)
- bsearch(value: float, before: bool = true) -> int
- clear()
- count(value: float) -> int
- duplicate() -> PackedFloat64Array
- erase(value: float) -> bool
- fill(value: float)
- find(value: float, from: int = 0) -> int
- get(index: int) -> float
- has(value: float) -> bool
- insert(at_index: int, value: float) -> int
- is_empty() -> bool
- push_back(value: float) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: float, from: int = -1) -> int
- set(index: int, value: float)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedFloat64Array
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator +
- operator ==
- operator []
