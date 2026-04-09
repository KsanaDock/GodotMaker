## SkeletonModification2DCCDIK <- SkeletonModification2D

**Props:**
- ccdik_data_chain_length: int = 0
- target_nodepath: NodePath = NodePath("")
- tip_nodepath: NodePath = NodePath("")

**Methods:**
- get_ccdik_joint_bone2d_node(joint_idx: int) -> NodePath
- get_ccdik_joint_bone_index(joint_idx: int) -> int
- get_ccdik_joint_constraint_angle_invert(joint_idx: int) -> bool
- get_ccdik_joint_constraint_angle_max(joint_idx: int) -> float
- get_ccdik_joint_constraint_angle_min(joint_idx: int) -> float
- get_ccdik_joint_enable_constraint(joint_idx: int) -> bool
- get_ccdik_joint_rotate_from_joint(joint_idx: int) -> bool
- set_ccdik_joint_bone2d_node(joint_idx: int, bone2d_nodepath: NodePath)
- set_ccdik_joint_bone_index(joint_idx: int, bone_idx: int)
- set_ccdik_joint_constraint_angle_invert(joint_idx: int, invert: bool)
- set_ccdik_joint_constraint_angle_max(joint_idx: int, angle_max: float)
- set_ccdik_joint_constraint_angle_min(joint_idx: int, angle_min: float)
- set_ccdik_joint_enable_constraint(joint_idx: int, enable_constraint: bool)
- set_ccdik_joint_rotate_from_joint(joint_idx: int, rotate_from_joint: bool)
