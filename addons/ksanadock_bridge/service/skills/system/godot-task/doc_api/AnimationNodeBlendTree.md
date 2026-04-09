## AnimationNodeBlendTree <- AnimationRootNode

**Props:**
- graph_offset: Vector2 = Vector2(0, 0)

**Methods:**
- add_node(name: StringName, node: AnimationNode, position: Vector2 = Vector2(0, 0))
- connect_node(input_node: StringName, input_index: int, output_node: StringName)
- disconnect_node(input_node: StringName, input_index: int)
- get_node(name: StringName) -> AnimationNode
- get_node_list() -> StringName[]
- get_node_position(name: StringName) -> Vector2
- has_node(name: StringName) -> bool
- remove_node(name: StringName)
- rename_node(name: StringName, new_name: StringName)
- set_node_position(name: StringName, position: Vector2)

**Signals:**
- node_changed(node_name: StringName)
