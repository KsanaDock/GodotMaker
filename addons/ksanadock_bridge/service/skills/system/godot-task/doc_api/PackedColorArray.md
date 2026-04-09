## PackedColorArray

**Ctors:**
- PackedColorArray()
- PackedColorArray(from: PackedColorArray)
- PackedColorArray(from: Array)

**Methods:**
- append(value: Color) -> bool
- append_array(array: PackedColorArray)
- bsearch(value: Color, before: bool = true) -> int
- clear()
- count(value: Color) -> int
- duplicate() -> PackedColorArray
- erase(value: Color) -> bool
- fill(value: Color)
- find(value: Color, from: int = 0) -> int
- get(index: int) -> Color
- has(value: Color) -> bool
- insert(at_index: int, value: Color) -> int
- is_empty() -> bool
- push_back(value: Color) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: Color, from: int = -1) -> int
- set(index: int, value: Color)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedColorArray
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator +
- operator ==
- operator []
