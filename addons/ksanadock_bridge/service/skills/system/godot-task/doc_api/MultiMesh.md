## MultiMesh <- Resource

**Props:**
- buffer: PackedFloat32Array = PackedFloat32Array()
- color_array: PackedColorArray
- custom_aabb: AABB = AABB(0, 0, 0, 0, 0, 0)
- custom_data_array: PackedColorArray
- instance_count: int = 0
- mesh: Mesh
- physics_interpolation_quality: int = 0
- transform_2d_array: PackedVector2Array
- transform_array: PackedVector3Array
- transform_format: int = 0
- use_colors: bool = false
- use_custom_data: bool = false
- visible_instance_count: int = -1

**Methods:**
- get_aabb() -> AABB
- get_instance_color(instance: int) -> Color
- get_instance_custom_data(instance: int) -> Color
- get_instance_transform(instance: int) -> Transform3D
- get_instance_transform_2d(instance: int) -> Transform2D
- reset_instance_physics_interpolation(instance: int)
- reset_instances_physics_interpolation()
- set_buffer_interpolated(buffer_curr: PackedFloat32Array, buffer_prev: PackedFloat32Array)
- set_instance_color(instance: int, color: Color)
- set_instance_custom_data(instance: int, custom_data: Color)
- set_instance_transform(instance: int, transform: Transform3D)
- set_instance_transform_2d(instance: int, transform: Transform2D)
