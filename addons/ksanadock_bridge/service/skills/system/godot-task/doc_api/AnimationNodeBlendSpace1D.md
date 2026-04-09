## AnimationNodeBlendSpace1D <- AnimationRootNode

**Props:**
- blend_mode: int = 0
- max_space: float = 1.0
- min_space: float = -1.0
- snap: float = 0.1
- sync: bool = false
- value_label: String = "value"

**Methods:**
- add_blend_point(node: AnimationRootNode, pos: float, at_index: int = -1, name: StringName = &"")
- find_blend_point_by_name(name: StringName) -> int
- get_blend_point_count() -> int
- get_blend_point_name(point: int) -> StringName
- get_blend_point_node(point: int) -> AnimationRootNode
- get_blend_point_position(point: int) -> float
- remove_blend_point(point: int)
- reorder_blend_point(from_index: int, to_index: int)
- set_blend_point_name(point: int, name: StringName)
- set_blend_point_node(point: int, node: AnimationRootNode)
- set_blend_point_position(point: int, pos: float)
