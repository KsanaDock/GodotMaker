## SceneState <- RefCounted

**Methods:**
- get_base_scene_state() -> SceneState
- get_connection_binds(idx: int) -> Array
- get_connection_count() -> int
- get_connection_flags(idx: int) -> int
- get_connection_method(idx: int) -> StringName
- get_connection_signal(idx: int) -> StringName
- get_connection_source(idx: int) -> NodePath
- get_connection_target(idx: int) -> NodePath
- get_connection_unbinds(idx: int) -> int
- get_node_count() -> int
- get_node_groups(idx: int) -> PackedStringArray
- get_node_index(idx: int) -> int
- get_node_instance(idx: int) -> PackedScene
- get_node_instance_placeholder(idx: int) -> String
- get_node_name(idx: int) -> StringName
- get_node_owner_path(idx: int) -> NodePath
- get_node_path(idx: int, for_parent: bool = false) -> NodePath
- get_node_property_count(idx: int) -> int
- get_node_property_name(idx: int, prop_idx: int) -> StringName
- get_node_property_value(idx: int, prop_idx: int) -> Variant
- get_node_type(idx: int) -> StringName
- get_path() -> String
- is_node_instance_placeholder(idx: int) -> bool
