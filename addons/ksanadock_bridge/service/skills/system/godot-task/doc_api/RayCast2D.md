## RayCast2D <- Node2D

**Props:**
- collide_with_areas: bool = false
- collide_with_bodies: bool = true
- collision_mask: int = 1
- enabled: bool = true
- exclude_parent: bool = true
- hit_from_inside: bool = false
- target_position: Vector2 = Vector2(0, 50)

**Methods:**
- add_exception(node: CollisionObject2D)
- add_exception_rid(rid: RID)
- clear_exceptions()
- force_raycast_update()
- get_collider() -> Object
- get_collider_rid() -> RID
- get_collider_shape() -> int
- get_collision_mask_value(layer_number: int) -> bool
- get_collision_normal() -> Vector2
- get_collision_point() -> Vector2
- is_colliding() -> bool
- remove_exception(node: CollisionObject2D)
- remove_exception_rid(rid: RID)
- set_collision_mask_value(layer_number: int, value: bool)
