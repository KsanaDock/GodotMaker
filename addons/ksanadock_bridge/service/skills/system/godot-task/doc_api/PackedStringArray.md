## PackedStringArray

**Ctors:**
- PackedStringArray()
- PackedStringArray(from: PackedStringArray)
- PackedStringArray(from: Array)

**Methods:**
- append(value: String) -> bool
- append_array(array: PackedStringArray)
- bsearch(value: String, before: bool = true) -> int
- clear()
- count(value: String) -> int
- duplicate() -> PackedStringArray
- erase(value: String) -> bool
- fill(value: String)
- find(value: String, from: int = 0) -> int
- get(index: int) -> String
- has(value: String) -> bool
- insert(at_index: int, value: String) -> int
- is_empty() -> bool
- push_back(value: String) -> bool
- remove_at(index: int)
- resize(new_size: int) -> int
- reverse()
- rfind(value: String, from: int = -1) -> int
- set(index: int, value: String)
- size() -> int
- slice(begin: int, end: int = 2147483647) -> PackedStringArray
- sort()
- to_byte_array() -> PackedByteArray

**Operators:**
- operator !=
- operator +
- operator ==
- operator []
