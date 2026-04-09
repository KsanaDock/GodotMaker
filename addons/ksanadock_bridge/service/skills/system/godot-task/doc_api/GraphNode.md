## GraphNode <- GraphElement

**Props:**
- focus_mode: int = 3
- ignore_invalid_connection_type: bool = false
- mouse_filter: int = 0
- slots_focus_mode: int = 3
- title: String = ""

**Methods:**
- clear_all_slots()
- clear_slot(slot_index: int)
- get_input_port_color(port_idx: int) -> Color
- get_input_port_count() -> int
- get_input_port_position(port_idx: int) -> Vector2
- get_input_port_slot(port_idx: int) -> int
- get_input_port_type(port_idx: int) -> int
- get_output_port_color(port_idx: int) -> Color
- get_output_port_count() -> int
- get_output_port_position(port_idx: int) -> Vector2
- get_output_port_slot(port_idx: int) -> int
- get_output_port_type(port_idx: int) -> int
- get_slot_color_left(slot_index: int) -> Color
- get_slot_color_right(slot_index: int) -> Color
- get_slot_custom_icon_left(slot_index: int) -> Texture2D
- get_slot_custom_icon_right(slot_index: int) -> Texture2D
- get_slot_metadata_left(slot_index: int) -> Variant
- get_slot_metadata_right(slot_index: int) -> Variant
- get_slot_type_left(slot_index: int) -> int
- get_slot_type_right(slot_index: int) -> int
- get_titlebar_hbox() -> HBoxContainer
- is_slot_draw_stylebox(slot_index: int) -> bool
- is_slot_enabled_left(slot_index: int) -> bool
- is_slot_enabled_right(slot_index: int) -> bool
- set_slot(slot_index: int, enable_left_port: bool, type_left: int, color_left: Color, enable_right_port: bool, type_right: int, color_right: Color, custom_icon_left: Texture2D = null, custom_icon_right: Texture2D = null, draw_stylebox: bool = true)
- set_slot_color_left(slot_index: int, color: Color)
- set_slot_color_right(slot_index: int, color: Color)
- set_slot_custom_icon_left(slot_index: int, custom_icon: Texture2D)
- set_slot_custom_icon_right(slot_index: int, custom_icon: Texture2D)
- set_slot_draw_stylebox(slot_index: int, enable: bool)
- set_slot_enabled_left(slot_index: int, enable: bool)
- set_slot_enabled_right(slot_index: int, enable: bool)
- set_slot_metadata_left(slot_index: int, value: Variant)
- set_slot_metadata_right(slot_index: int, value: Variant)
- set_slot_type_left(slot_index: int, type: int)
- set_slot_type_right(slot_index: int, type: int)

**Signals:**
- slot_sizes_changed
- slot_updated(slot_index: int)
