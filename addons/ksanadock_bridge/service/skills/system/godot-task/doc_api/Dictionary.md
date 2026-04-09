## Dictionary

**Ctors:**
- Dictionary()
- Dictionary(base: Dictionary, key_type: int, key_class_name: StringName, key_script: Variant, value_type: int, value_class_name: StringName, value_script: Variant)
- Dictionary(from: Dictionary)

**Methods:**
- assign(dictionary: Dictionary)
- clear()
- duplicate(deep: bool = false) -> Dictionary
- duplicate_deep(deep_subresources_mode: int = 1) -> Dictionary
- erase(key: Variant) -> bool
- find_key(value: Variant) -> Variant
- get(key: Variant, default: Variant = null) -> Variant
- get_or_add(key: Variant, default: Variant = null) -> Variant
- get_typed_key_builtin() -> int
- get_typed_key_class_name() -> StringName
- get_typed_key_script() -> Variant
- get_typed_value_builtin() -> int
- get_typed_value_class_name() -> StringName
- get_typed_value_script() -> Variant
- has(key: Variant) -> bool
- has_all(keys: Array) -> bool
- hash() -> int
- is_empty() -> bool
- is_read_only() -> bool
- is_same_typed(dictionary: Dictionary) -> bool
- is_same_typed_key(dictionary: Dictionary) -> bool
- is_same_typed_value(dictionary: Dictionary) -> bool
- is_typed() -> bool
- is_typed_key() -> bool
- is_typed_value() -> bool
- keys() -> Array
- make_read_only()
- merge(dictionary: Dictionary, overwrite: bool = false)
- merged(dictionary: Dictionary, overwrite: bool = false) -> Dictionary
- recursive_equal(dictionary: Dictionary, recursion_count: int) -> bool
- set(key: Variant, value: Variant) -> bool
- size() -> int
- sort()
- values() -> Array

**Operators:**
- operator !=
- operator ==
- operator []
