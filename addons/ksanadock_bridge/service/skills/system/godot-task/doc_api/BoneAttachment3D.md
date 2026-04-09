## BoneAttachment3D <- Node3D

**Props:**
- bone_idx: int = -1
- bone_name: String = ""
- external_skeleton: NodePath
- override_pose: bool = false
- physics_interpolation_mode: int = 2
- use_external_skeleton: bool = false

**Methods:**
- get_skeleton() -> Skeleton3D
- on_skeleton_update()
