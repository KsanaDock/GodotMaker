## LookAtModifier3D <- SkeletonModifier3D

**Props:**
- bone: int = -1
- bone_name: String = ""
- duration: float = 0.0
- ease_type: int = 0
- forward_axis: int = 4
- origin_bone: int
- origin_bone_name: String
- origin_external_node: NodePath
- origin_from: int = 0
- origin_offset: Vector3 = Vector3(0, 0, 0)
- origin_safe_margin: float = 0.1
- primary_damp_threshold: float
- primary_limit_angle: float
- primary_negative_damp_threshold: float
- primary_negative_limit_angle: float
- primary_positive_damp_threshold: float
- primary_positive_limit_angle: float
- primary_rotation_axis: int = 1
- relative: bool = false
- secondary_damp_threshold: float
- secondary_limit_angle: float
- secondary_negative_damp_threshold: float
- secondary_negative_limit_angle: float
- secondary_positive_damp_threshold: float
- secondary_positive_limit_angle: float
- symmetry_limitation: bool
- target_node: NodePath = NodePath("")
- transition_type: int = 0
- use_angle_limitation: bool = false
- use_secondary_rotation: bool = true

**Methods:**
- get_interpolation_remaining() -> float
- is_interpolating() -> bool
- is_target_within_limitation() -> bool
