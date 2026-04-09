## ShapeCast3D <- Node3D

**Props:**
- collide_with_areas: bool = false
- collide_with_bodies: bool = true
- collision_mask: int = 1
- collision_result: Array = []
- debug_shape_custom_color: Color = Color(0, 0, 0, 1)
- enabled: bool = true
- exclude_parent: bool = true
- margin: float = 0.0
- max_results: int = 32
- shape: Shape3D
- target_position: Vector3 = Vector3(0, -1, 0)

**Methods:**
- add_exception(node: CollisionObject3D)
- add_exception_rid(rid: RID)
- clear_exceptions()
- force_shapecast_update()
- get_closest_collision_safe_fraction() -> float
- get_closest_collision_unsafe_fraction() -> float
- get_collider(index: int) -> Object
- get_collider_rid(index: int) -> RID
- get_collider_shape(index: int) -> int
- get_collision_count() -> int
- get_collision_mask_value(layer_number: int) -> bool
- get_collision_normal(index: int) -> Vector3
- get_collision_point(index: int) -> Vector3
- is_colliding() -> bool
- remove_exception(node: CollisionObject3D)
- remove_exception_rid(rid: RID)
- resource_changed(resource: Resource)
- set_collision_mask_value(layer_number: int, value: bool)
