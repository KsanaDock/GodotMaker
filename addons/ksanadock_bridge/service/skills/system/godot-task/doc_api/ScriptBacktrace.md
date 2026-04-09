## ScriptBacktrace <- RefCounted

**Methods:**
- format(indent_all: int = 0, indent_frames: int = 4) -> String
- get_frame_count() -> int
- get_frame_file(index: int) -> String
- get_frame_function(index: int) -> String
- get_frame_line(index: int) -> int
- get_global_variable_count() -> int
- get_global_variable_name(variable_index: int) -> String
- get_global_variable_value(variable_index: int) -> Variant
- get_language_name() -> String
- get_local_variable_count(frame_index: int) -> int
- get_local_variable_name(frame_index: int, variable_index: int) -> String
- get_local_variable_value(frame_index: int, variable_index: int) -> Variant
- get_member_variable_count(frame_index: int) -> int
- get_member_variable_name(frame_index: int, variable_index: int) -> String
- get_member_variable_value(frame_index: int, variable_index: int) -> Variant
- is_empty() -> bool
