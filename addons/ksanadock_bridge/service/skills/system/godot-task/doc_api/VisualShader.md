## VisualShader <- Shader

**Props:**
- graph_offset: Vector2

**Methods:**
- add_node(type: int, node: VisualShaderNode, position: Vector2, id: int)
- add_varying(name: String, mode: int, type: int)
- attach_node_to_frame(type: int, id: int, frame: int)
- can_connect_nodes(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> bool
- connect_nodes(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> int
- connect_nodes_forced(type: int, from_node: int, from_port: int, to_node: int, to_port: int)
- detach_node_from_frame(type: int, id: int)
- disconnect_nodes(type: int, from_node: int, from_port: int, to_node: int, to_port: int)
- get_node(type: int, id: int) -> VisualShaderNode
- get_node_connections(type: int) -> Dictionary[]
- get_node_list(type: int) -> PackedInt32Array
- get_node_position(type: int, id: int) -> Vector2
- get_valid_node_id(type: int) -> int
- has_varying(name: String) -> bool
- is_node_connection(type: int, from_node: int, from_port: int, to_node: int, to_port: int) -> bool
- remove_node(type: int, id: int)
- remove_varying(name: String)
- replace_node(type: int, id: int, new_class: StringName)
- set_mode(mode: int)
- set_node_position(type: int, id: int, position: Vector2)
