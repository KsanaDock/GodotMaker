## Area2D <- CollisionObject2D

**Props:**
- angular_damp: float = 1.0
- angular_damp_space_override: int = 0
- audio_bus_name: StringName = &"Master"
- audio_bus_override: bool = false
- gravity: float = 980.0
- gravity_direction: Vector2 = Vector2(0, 1)
- gravity_point: bool = false
- gravity_point_center: Vector2 = Vector2(0, 1)
- gravity_point_unit_distance: float = 0.0
- gravity_space_override: int = 0
- linear_damp: float = 0.1
- linear_damp_space_override: int = 0
- monitorable: bool = true
- monitoring: bool = true
- priority: int = 0

**Methods:**
- get_overlapping_areas() -> Area2D[]
- get_overlapping_bodies() -> Node2D[]
- has_overlapping_areas() -> bool
- has_overlapping_bodies() -> bool
- overlaps_area(area: Node) -> bool
- overlaps_body(body: Node) -> bool

**Signals:**
- area_entered(area: Area2D)
- area_exited(area: Area2D)
- area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int)
- area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int)
- body_entered(body: Node2D)
- body_exited(body: Node2D)
- body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int)
- body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int)
