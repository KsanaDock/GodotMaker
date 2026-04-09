## ConfigFile <- RefCounted

**Methods:**
- clear()
- encode_to_text() -> String
- erase_section(section: String)
- erase_section_key(section: String, key: String)
- get_section_keys(section: String) -> PackedStringArray
- get_sections() -> PackedStringArray
- get_value(section: String, key: String, default: Variant = null) -> Variant
- has_section(section: String) -> bool
- has_section_key(section: String, key: String) -> bool
- load(path: String) -> int
- load_encrypted(path: String, key: PackedByteArray) -> int
- load_encrypted_pass(path: String, password: String) -> int
- parse(data: String) -> int
- save(path: String) -> int
- save_encrypted(path: String, key: PackedByteArray) -> int
- save_encrypted_pass(path: String, password: String) -> int
- set_value(section: String, key: String, value: Variant)
