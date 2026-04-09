## NavigationObstacle3D <- Node3D

**Props:**
- affect_navigation_mesh: bool = false
- avoidance_enabled: bool = true
- avoidance_layers: int = 1
- carve_navigation_mesh: bool = false
- height: float = 1.0
- radius: float = 0.0
- use_3d_avoidance: bool = false
- velocity: Vector3 = Vector3(0, 0, 0)
- vertices: PackedVector3Array = PackedVector3Array()

**Methods:**
- get_avoidance_layer_value(layer_number: int) -> bool
- get_navigation_map() -> RID
- get_rid() -> RID
- set_avoidance_layer_value(layer_number: int, value: bool)
- set_navigation_map(navigation_map: RID)
