## JSON <- Resource

**Props:**
- data: Variant = null

**Methods:**
- from_native(variant: Variant, full_objects: bool = false) -> Variant
- get_error_line() -> int
- get_error_message() -> String
- get_parsed_text() -> String
- parse(json_text: String, keep_text: bool = false) -> int
- parse_string(json_string: String) -> Variant
- stringify(data: Variant, indent: String = "", sort_keys: bool = true, full_precision: bool = false) -> String
- to_native(json: Variant, allow_objects: bool = false) -> Variant
