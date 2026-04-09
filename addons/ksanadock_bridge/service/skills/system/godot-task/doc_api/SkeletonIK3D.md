## SkeletonIK3D <- SkeletonModifier3D

**Props:**
- interpolation: float
- magnet: Vector3 = Vector3(0, 0, 0)
- max_iterations: int = 10
- min_distance: float = 0.01
- override_tip_basis: bool = true
- root_bone: StringName = &""
- target: Transform3D = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)
- target_node: NodePath = NodePath("")
- tip_bone: StringName = &""
- use_magnet: bool = false

**Methods:**
- get_parent_skeleton() -> Skeleton3D
- is_running() -> bool
- start(one_time: bool = false)
- stop()
