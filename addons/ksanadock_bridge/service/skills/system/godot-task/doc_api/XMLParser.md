## XMLParser <- RefCounted

**Methods:**
- get_attribute_count() -> int
- get_attribute_name(idx: int) -> String
- get_attribute_value(idx: int) -> String
- get_current_line() -> int
- get_named_attribute_value(name: String) -> String
- get_named_attribute_value_safe(name: String) -> String
- get_node_data() -> String
- get_node_name() -> String
- get_node_offset() -> int
- get_node_type() -> int
- has_attribute(name: String) -> bool
- is_empty() -> bool
- open(file: String) -> int
- open_buffer(buffer: PackedByteArray) -> int
- read() -> int
- seek(position: int) -> int
- skip_section()
