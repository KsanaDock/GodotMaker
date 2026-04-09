## RayCast3D <- Node3D

**Props:**
- collide_with_areas: bool = false
- collide_with_bodies: bool = true
- collision_mask: int = 1
- debug_shape_custom_color: Color = Color(0, 0, 0, 1)
- debug_shape_thickness: int = 2
- enabled: bool = true
- exclude_parent: bool = true
- hit_back_faces: bool = true
- hit_from_inside: bool = false
- target_position: Vector3 = Vector3(0, -1, 0)

**Methods:**
- add_exception(node: CollisionObject3D)
- add_exception_rid(rid: RID)
- clear_exceptions()
- force_raycast_update()
- get_collider() -> Object
- get_collider_rid() -> RID
- get_collider_shape() -> int
- get_collision_face_index() -> int
- get_collision_mask_value(layer_number: int) -> bool
- get_collision_normal() -> Vector3
- get_collision_point() -> Vector3
- is_colliding() -> bool
- remove_exception(node: CollisionObject3D)
- remove_exception_rid(rid: RID)
- set_collision_mask_value(layer_number: int, value: bool)
