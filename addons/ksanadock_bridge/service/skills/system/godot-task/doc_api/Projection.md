## Projection

**Props:**
- w: Vector4 = Vector4(0, 0, 0, 1)
- x: Vector4 = Vector4(1, 0, 0, 0)
- y: Vector4 = Vector4(0, 1, 0, 0)
- z: Vector4 = Vector4(0, 0, 1, 0)

**Ctors:**
- Projection()
- Projection(from: Projection)
- Projection(from: Transform3D)
- Projection(x_axis: Vector4, y_axis: Vector4, z_axis: Vector4, w_axis: Vector4)

**Methods:**
- create_depth_correction(flip_y: bool) -> Projection
- create_fit_aabb(aabb: AABB) -> Projection
- create_for_hmd(eye: int, aspect: float, intraocular_dist: float, display_width: float, display_to_lens: float, oversample: float, z_near: float, z_far: float) -> Projection
- create_frustum(left: float, right: float, bottom: float, top: float, z_near: float, z_far: float) -> Projection
- create_frustum_aspect(size: float, aspect: float, offset: Vector2, z_near: float, z_far: float, flip_fov: bool = false) -> Projection
- create_light_atlas_rect(rect: Rect2) -> Projection
- create_orthogonal(left: float, right: float, bottom: float, top: float, z_near: float, z_far: float) -> Projection
- create_orthogonal_aspect(size: float, aspect: float, z_near: float, z_far: float, flip_fov: bool = false) -> Projection
- create_perspective(fovy: float, aspect: float, z_near: float, z_far: float, flip_fov: bool = false) -> Projection
- create_perspective_hmd(fovy: float, aspect: float, z_near: float, z_far: float, flip_fov: bool, eye: int, intraocular_dist: float, convergence_dist: float) -> Projection
- determinant() -> float
- flipped_y() -> Projection
- get_aspect() -> float
- get_far_plane_half_extents() -> Vector2
- get_fov() -> float
- get_fovy(fovx: float, aspect: float) -> float
- get_lod_multiplier() -> float
- get_pixels_per_meter(for_pixel_width: int) -> int
- get_projection_plane(plane: int) -> Plane
- get_viewport_half_extents() -> Vector2
- get_z_far() -> float
- get_z_near() -> float
- inverse() -> Projection
- is_orthogonal() -> bool
- jitter_offseted(offset: Vector2) -> Projection
- perspective_znear_adjusted(new_znear: float) -> Projection

**Operators:**
- operator !=
- operator *
- operator *
- operator ==
- operator []
