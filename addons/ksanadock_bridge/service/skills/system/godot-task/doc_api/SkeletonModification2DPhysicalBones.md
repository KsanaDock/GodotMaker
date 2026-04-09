## SkeletonModification2DPhysicalBones <- SkeletonModification2D

**Props:**
- physical_bone_chain_length: int = 0

**Methods:**
- fetch_physical_bones()
- get_physical_bone_node(joint_idx: int) -> NodePath
- set_physical_bone_node(joint_idx: int, physicalbone2d_node: NodePath)
- start_simulation(bones: StringName[] = [])
- stop_simulation(bones: StringName[] = [])
