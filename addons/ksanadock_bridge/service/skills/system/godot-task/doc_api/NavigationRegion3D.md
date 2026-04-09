## NavigationRegion3D <- Node3D

**Props:**
- enabled: bool = true
- enter_cost: float = 0.0
- navigation_layers: int = 1
- navigation_mesh: NavigationMesh
- travel_cost: float = 1.0
- use_edge_connections: bool = true

**Methods:**
- bake_navigation_mesh(on_thread: bool = true)
- get_bounds() -> AABB
- get_navigation_layer_value(layer_number: int) -> bool
- get_navigation_map() -> RID
- get_region_rid() -> RID
- get_rid() -> RID
- is_baking() -> bool
- set_navigation_layer_value(layer_number: int, value: bool)
- set_navigation_map(navigation_map: RID)

**Signals:**
- bake_finished
- navigation_mesh_changed
