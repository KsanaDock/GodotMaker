## Camera3D <- Node3D

**Props:**
- attributes: CameraAttributes
- compositor: Compositor
- cull_mask: int = 1048575
- current: bool = false
- doppler_tracking: int = 0
- environment: Environment
- far: float = 4000.0
- fov: float = 75.0
- frustum_offset: Vector2 = Vector2(0, 0)
- h_offset: float = 0.0
- keep_aspect: int = 1
- near: float = 0.05
- projection: int = 0
- size: float = 1.0
- v_offset: float = 0.0

**Methods:**
- clear_current(enable_next: bool = true)
- get_camera_projection() -> Projection
- get_camera_rid() -> RID
- get_camera_transform() -> Transform3D
- get_cull_mask_value(layer_number: int) -> bool
- get_frustum() -> Plane[]
- get_pyramid_shape_rid() -> RID
- is_position_behind(world_point: Vector3) -> bool
- is_position_in_frustum(world_point: Vector3) -> bool
- make_current()
- project_local_ray_normal(screen_point: Vector2) -> Vector3
- project_position(screen_point: Vector2, z_depth: float) -> Vector3
- project_ray_normal(screen_point: Vector2) -> Vector3
- project_ray_origin(screen_point: Vector2) -> Vector3
- set_cull_mask_value(layer_number: int, value: bool)
- set_frustum(size: float, offset: Vector2, z_near: float, z_far: float)
- set_orthogonal(size: float, z_near: float, z_far: float)
- set_perspective(fov: float, z_near: float, z_far: float)
- unproject_position(world_point: Vector3) -> Vector2
