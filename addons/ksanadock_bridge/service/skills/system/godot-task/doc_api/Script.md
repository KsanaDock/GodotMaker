## Script <- Resource

**Props:**
- source_code: String

**Methods:**
- can_instantiate() -> bool
- get_base_script() -> Script
- get_global_name() -> StringName
- get_instance_base_type() -> StringName
- get_property_default_value(property: StringName) -> Variant
- get_rpc_config() -> Variant
- get_script_constant_map() -> Dictionary
- get_script_method_list() -> Dictionary[]
- get_script_property_list() -> Dictionary[]
- get_script_signal_list() -> Dictionary[]
- has_script_method(method_name: StringName) -> bool
- has_script_signal(signal_name: StringName) -> bool
- has_source_code() -> bool
- instance_has(base_object: Object) -> bool
- is_abstract() -> bool
- is_tool() -> bool
- reload(keep_state: bool = false) -> int
