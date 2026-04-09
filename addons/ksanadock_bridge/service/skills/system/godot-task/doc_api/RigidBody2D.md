## RigidBody2D <- PhysicsBody2D

**Props:**
- angular_damp: float = 0.0
- angular_damp_mode: int = 0
- angular_velocity: float = 0.0
- can_sleep: bool = true
- center_of_mass: Vector2 = Vector2(0, 0)
- center_of_mass_mode: int = 0
- constant_force: Vector2 = Vector2(0, 0)
- constant_torque: float = 0.0
- contact_monitor: bool = false
- continuous_cd: int = 0
- custom_integrator: bool = false
- freeze: bool = false
- freeze_mode: int = 0
- gravity_scale: float = 1.0
- inertia: float = 0.0
- linear_damp: float = 0.0
- linear_damp_mode: int = 0
- linear_velocity: Vector2 = Vector2(0, 0)
- lock_rotation: bool = false
- mass: float = 1.0
- max_contacts_reported: int = 0
- physics_material_override: PhysicsMaterial
- sleeping: bool = false

**Methods:**
- add_constant_central_force(force: Vector2)
- add_constant_force(force: Vector2, position: Vector2 = Vector2(0, 0))
- add_constant_torque(torque: float)
- apply_central_force(force: Vector2)
- apply_central_impulse(impulse: Vector2 = Vector2(0, 0))
- apply_force(force: Vector2, position: Vector2 = Vector2(0, 0))
- apply_impulse(impulse: Vector2, position: Vector2 = Vector2(0, 0))
- apply_torque(torque: float)
- apply_torque_impulse(torque: float)
- get_colliding_bodies() -> Node2D[]
- get_contact_count() -> int
- set_axis_velocity(axis_velocity: Vector2)

**Signals:**
- body_entered(body: Node)
- body_exited(body: Node)
- body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int)
- body_shape_exited(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int)
- sleeping_state_changed
