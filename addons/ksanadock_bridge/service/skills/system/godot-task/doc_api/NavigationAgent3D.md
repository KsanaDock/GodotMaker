## NavigationAgent3D <- Node

**Props:**
- avoidance_enabled: bool = false
- avoidance_layers: int = 1
- avoidance_mask: int = 1
- avoidance_priority: float = 1.0
- debug_enabled: bool = false
- debug_path_custom_color: Color = Color(1, 1, 1, 1)
- debug_path_custom_point_size: float = 4.0
- debug_use_custom: bool = false
- height: float = 1.0
- keep_y_velocity: bool = true
- max_neighbors: int = 10
- max_speed: float = 10.0
- navigation_layers: int = 1
- neighbor_distance: float = 50.0
- path_desired_distance: float = 1.0
- path_height_offset: float = 0.0
- path_max_distance: float = 5.0
- path_metadata_flags: int = 7
- path_postprocessing: int = 0
- path_return_max_length: float = 0.0
- path_return_max_radius: float = 0.0
- path_search_max_distance: float = 0.0
- path_search_max_polygons: int = 4096
- pathfinding_algorithm: int = 0
- radius: float = 0.5
- simplify_epsilon: float = 0.0
- simplify_path: bool = false
- target_desired_distance: float = 1.0
- target_position: Vector3 = Vector3(0, 0, 0)
- time_horizon_agents: float = 1.0
- time_horizon_obstacles: float = 0.0
- use_3d_avoidance: bool = false
- velocity: Vector3 = Vector3(0, 0, 0)

**Methods:**
- distance_to_target() -> float
- get_avoidance_layer_value(layer_number: int) -> bool
- get_avoidance_mask_value(mask_number: int) -> bool
- get_current_navigation_path() -> PackedVector3Array
- get_current_navigation_path_index() -> int
- get_current_navigation_result() -> NavigationPathQueryResult3D
- get_final_position() -> Vector3
- get_navigation_layer_value(layer_number: int) -> bool
- get_navigation_map() -> RID
- get_next_path_position() -> Vector3
- get_path_length() -> float
- get_rid() -> RID
- is_navigation_finished() -> bool
- is_target_reachable() -> bool
- is_target_reached() -> bool
- set_avoidance_layer_value(layer_number: int, value: bool)
- set_avoidance_mask_value(mask_number: int, value: bool)
- set_navigation_layer_value(layer_number: int, value: bool)
- set_navigation_map(navigation_map: RID)
- set_velocity_forced(velocity: Vector3)

**Signals:**
- link_reached(details: Dictionary)
- navigation_finished
- path_changed
- target_reached
- velocity_computed(safe_velocity: Vector3)
- waypoint_reached(details: Dictionary)
