## Skeleton2D <- Node2D

**Methods:**
- execute_modifications(delta: float, execution_mode: int)
- get_bone(idx: int) -> Bone2D
- get_bone_count() -> int
- get_bone_local_pose_override(bone_idx: int) -> Transform2D
- get_modification_stack() -> SkeletonModificationStack2D
- get_skeleton() -> RID
- set_bone_local_pose_override(bone_idx: int, override_pose: Transform2D, strength: float, persistent: bool)
- set_modification_stack(modification_stack: SkeletonModificationStack2D)

**Signals:**
- bone_setup_changed
