## PhysicsDirectSpaceState3D <- Object

**Methods:**
- cast_motion(parameters: PhysicsShapeQueryParameters3D) -> PackedFloat32Array
- collide_shape(parameters: PhysicsShapeQueryParameters3D, max_results: int = 32) -> Vector3[]
- get_rest_info(parameters: PhysicsShapeQueryParameters3D) -> Dictionary
- intersect_point(parameters: PhysicsPointQueryParameters3D, max_results: int = 32) -> Dictionary[]
- intersect_ray(parameters: PhysicsRayQueryParameters3D) -> Dictionary
- intersect_shape(parameters: PhysicsShapeQueryParameters3D, max_results: int = 32) -> Dictionary[]
