## NavigationObstacle2D <- Node2D

**Props:**
- affect_navigation_mesh: bool = false
- avoidance_enabled: bool = true
- avoidance_layers: int = 1
- carve_navigation_mesh: bool = false
- radius: float = 0.0
- velocity: Vector2 = Vector2(0, 0)
- vertices: PackedVector2Array = PackedVector2Array()

**Methods:**
- get_avoidance_layer_value(layer_number: int) -> bool
- get_navigation_map() -> RID
- get_rid() -> RID
- set_avoidance_layer_value(layer_number: int, value: bool)
- set_navigation_map(navigation_map: RID)
