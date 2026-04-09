## AnimationNode <- Resource

**Props:**
- filter_enabled: bool

**Methods:**
- add_input(name: String) -> bool
- blend_animation(animation: StringName, time: float, delta: float, seeked: bool, is_external_seeking: bool, blend: float, looped_flag: int = 0)
- blend_input(input_index: int, time: float, seek: bool, is_external_seeking: bool, blend: float, filter: int = 0, sync: bool = true, test_only: bool = false) -> float
- blend_node(name: StringName, node: AnimationNode, time: float, seek: bool, is_external_seeking: bool, blend: float, filter: int = 0, sync: bool = true, test_only: bool = false) -> float
- find_input(name: String) -> int
- get_input_count() -> int
- get_input_name(input: int) -> String
- get_parameter(name: StringName) -> Variant
- get_processing_animation_tree_instance_id() -> int
- is_path_filtered(path: NodePath) -> bool
- is_process_testing() -> bool
- remove_input(index: int)
- set_filter_path(path: NodePath, enable: bool)
- set_input_name(input: int, name: String) -> bool
- set_parameter(name: StringName, value: Variant)

**Signals:**
- animation_node_removed(object_id: int, name: String)
- animation_node_renamed(object_id: int, old_name: String, new_name: String)
- node_updated(object_id: int)
- tree_changed
