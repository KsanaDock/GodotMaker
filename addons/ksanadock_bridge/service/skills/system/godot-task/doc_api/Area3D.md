## Area3D <- CollisionObject3D

**Props:**
- angular_damp: float = 0.1
- angular_damp_space_override: int = 0
- audio_bus_name: StringName = &"Master"
- audio_bus_override: bool = false
- gravity: float = 9.8
- gravity_direction: Vector3 = Vector3(0, -1, 0)
- gravity_point: bool = false
- gravity_point_center: Vector3 = Vector3(0, -1, 0)
- gravity_point_unit_distance: float = 0.0
- gravity_space_override: int = 0
- linear_damp: float = 0.1
- linear_damp_space_override: int = 0
- monitorable: bool = true
- monitoring: bool = true
- priority: int = 0
- reverb_bus_amount: float = 0.0
- reverb_bus_enabled: bool = false
- reverb_bus_name: StringName = &"Master"
- reverb_bus_uniformity: float = 0.0
- wind_attenuation_factor: float = 0.0
- wind_force_magnitude: float = 0.0
- wind_source_path: NodePath = NodePath("")

**Methods:**
- get_overlapping_areas() -> Area3D[]
- get_overlapping_bodies() -> Node3D[]
- has_overlapping_areas() -> bool
- has_overlapping_bodies() -> bool
- overlaps_area(area: Node) -> bool
- overlaps_body(body: Node) -> bool

**Signals:**
- area_entered(area: Area3D)
- area_exited(area: Area3D)
- area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int)
- area_shape_exited(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int)
- body_entered(body: Node3D)
- body_exited(body: Node3D)
- body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int)
- body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int)
