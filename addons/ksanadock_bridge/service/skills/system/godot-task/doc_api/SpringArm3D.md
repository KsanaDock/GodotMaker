## SpringArm3D <- Node3D

**Props:**
- collision_mask: int = 1
- margin: float = 0.01
- shape: Shape3D
- spring_length: float = 1.0

**Methods:**
- add_excluded_object(RID: RID)
- clear_excluded_objects()
- get_hit_length() -> float
- remove_excluded_object(RID: RID) -> bool
