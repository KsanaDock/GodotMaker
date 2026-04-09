## SkeletonModificationStack2D <- Resource

**Props:**
- enabled: bool = false
- modification_count: int = 0
- strength: float = 1.0

**Methods:**
- add_modification(modification: SkeletonModification2D)
- delete_modification(mod_idx: int)
- enable_all_modifications(enabled: bool)
- execute(delta: float, execution_mode: int)
- get_is_setup() -> bool
- get_modification(mod_idx: int) -> SkeletonModification2D
- get_skeleton() -> Skeleton2D
- set_modification(mod_idx: int, modification: SkeletonModification2D)
- setup()
