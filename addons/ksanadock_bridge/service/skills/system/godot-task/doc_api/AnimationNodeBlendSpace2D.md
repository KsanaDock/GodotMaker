## AnimationNodeBlendSpace2D <- AnimationRootNode

**Props:**
- auto_triangles: bool = true
- blend_mode: int = 0
- max_space: Vector2 = Vector2(1, 1)
- min_space: Vector2 = Vector2(-1, -1)
- snap: Vector2 = Vector2(0.1, 0.1)
- sync: bool = false
- x_label: String = "x"
- y_label: String = "y"

**Methods:**
- add_blend_point(node: AnimationRootNode, pos: Vector2, at_index: int = -1, name: StringName = &"")
- add_triangle(x: int, y: int, z: int, at_index: int = -1)
- find_blend_point_by_name(name: StringName) -> int
- get_blend_point_count() -> int
- get_blend_point_name(point: int) -> StringName
- get_blend_point_node(point: int) -> AnimationRootNode
- get_blend_point_position(point: int) -> Vector2
- get_triangle_count() -> int
- get_triangle_point(triangle: int, point: int) -> int
- remove_blend_point(point: int)
- remove_triangle(triangle: int)
- reorder_blend_point(from_index: int, to_index: int)
- set_blend_point_name(point: int, name: StringName)
- set_blend_point_node(point: int, node: AnimationRootNode)
- set_blend_point_position(point: int, pos: Vector2)

**Signals:**
- triangles_updated
