## VisualShaderNode <- Resource

**Props:**
- linked_parent_graph_frame: int = -1
- output_port_for_preview: int = -1

**Methods:**
- clear_default_input_values()
- get_default_input_port(type: int) -> int
- get_default_input_values() -> Array
- get_input_port_default_value(port: int) -> Variant
- remove_input_port_default_value(port: int)
- set_default_input_values(values: Array)
- set_input_port_default_value(port: int, value: Variant, prev_value: Variant = null)
