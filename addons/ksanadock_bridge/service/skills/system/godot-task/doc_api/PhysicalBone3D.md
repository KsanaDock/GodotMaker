## PhysicalBone3D <- PhysicsBody3D

**Props:**
- angular_damp: float = 0.0
- angular_damp_mode: int = 0
- angular_velocity: Vector3 = Vector3(0, 0, 0)
- body_offset: Transform3D = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)
- bounce: float = 0.0
- can_sleep: bool = true
- custom_integrator: bool = false
- friction: float = 1.0
- gravity_scale: float = 1.0
- joint_offset: Transform3D = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)
- joint_rotation: Vector3 = Vector3(0, 0, 0)
- joint_type: int = 0
- linear_damp: float = 0.0
- linear_damp_mode: int = 0
- linear_velocity: Vector3 = Vector3(0, 0, 0)
- mass: float = 1.0

**Methods:**
- apply_central_impulse(impulse: Vector3)
- apply_impulse(impulse: Vector3, position: Vector3 = Vector3(0, 0, 0))
- get_bone_id() -> int
- get_simulate_physics() -> bool
- is_simulating_physics() -> bool
