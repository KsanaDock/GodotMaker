## CollisionObject3D <- Node3D

**Props:**
- collision_layer: int = 1
- collision_mask: int = 1
- collision_priority: float = 1.0
- disable_mode: int = 0
- input_capture_on_drag: bool = false
- input_ray_pickable: bool = true

**Methods:**
- create_shape_owner(owner: Object) -> int
- get_collision_layer_value(layer_number: int) -> bool
- get_collision_mask_value(layer_number: int) -> bool
- get_rid() -> RID
- get_shape_owners() -> PackedInt32Array
- is_shape_owner_disabled(owner_id: int) -> bool
- remove_shape_owner(owner_id: int)
- set_collision_layer_value(layer_number: int, value: bool)
- set_collision_mask_value(layer_number: int, value: bool)
- shape_find_owner(shape_index: int) -> int
- shape_owner_add_shape(owner_id: int, shape: Shape3D)
- shape_owner_clear_shapes(owner_id: int)
- shape_owner_get_owner(owner_id: int) -> Object
- shape_owner_get_shape(owner_id: int, shape_id: int) -> Shape3D
- shape_owner_get_shape_count(owner_id: int) -> int
- shape_owner_get_shape_index(owner_id: int, shape_id: int) -> int
- shape_owner_get_transform(owner_id: int) -> Transform3D
- shape_owner_remove_shape(owner_id: int, shape_id: int)
- shape_owner_set_disabled(owner_id: int, disabled: bool)
- shape_owner_set_transform(owner_id: int, transform: Transform3D)

**Signals:**
- input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int)
- mouse_entered
- mouse_exited
