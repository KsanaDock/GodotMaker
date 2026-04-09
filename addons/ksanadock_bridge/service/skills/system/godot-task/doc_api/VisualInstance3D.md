## VisualInstance3D <- Node3D

**Props:**
- layers: int = 1
- sorting_offset: float = 0.0
- sorting_use_aabb_center: bool

**Methods:**
- get_aabb() -> AABB
- get_base() -> RID
- get_instance() -> RID
- get_layer_mask_value(layer_number: int) -> bool
- set_base(base: RID)
- set_layer_mask_value(layer_number: int, value: bool)
