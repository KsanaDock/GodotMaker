## NodePath

**Ctors:**
- NodePath()
- NodePath(from: NodePath)
- NodePath(from: String)

**Methods:**
- get_as_property_path() -> NodePath
- get_concatenated_names() -> StringName
- get_concatenated_subnames() -> StringName
- get_name(idx: int) -> StringName
- get_name_count() -> int
- get_subname(idx: int) -> StringName
- get_subname_count() -> int
- hash() -> int
- is_absolute() -> bool
- is_empty() -> bool
- slice(begin: int, end: int = 2147483647) -> NodePath

**Operators:**
- operator !=
- operator ==
