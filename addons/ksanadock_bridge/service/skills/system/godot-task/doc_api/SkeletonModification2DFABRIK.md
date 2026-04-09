## SkeletonModification2DFABRIK <- SkeletonModification2D

**Props:**
- fabrik_data_chain_length: int = 0
- target_nodepath: NodePath = NodePath("")

**Methods:**
- get_fabrik_joint_bone2d_node(joint_idx: int) -> NodePath
- get_fabrik_joint_bone_index(joint_idx: int) -> int
- get_fabrik_joint_magnet_position(joint_idx: int) -> Vector2
- get_fabrik_joint_use_target_rotation(joint_idx: int) -> bool
- set_fabrik_joint_bone2d_node(joint_idx: int, bone2d_nodepath: NodePath)
- set_fabrik_joint_bone_index(joint_idx: int, bone_idx: int)
- set_fabrik_joint_magnet_position(joint_idx: int, magnet_position: Vector2)
- set_fabrik_joint_use_target_rotation(joint_idx: int, use_target_rotation: bool)
