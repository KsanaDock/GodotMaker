## MeshInstance3D <- GeometryInstance3D

**Props:**
- mesh: Mesh
- skeleton: NodePath = NodePath("")
- skin: Skin

**Methods:**
- bake_mesh_from_current_blend_shape_mix(existing: ArrayMesh = null) -> ArrayMesh
- bake_mesh_from_current_skeleton_pose(existing: ArrayMesh = null) -> ArrayMesh
- create_convex_collision(clean: bool = true, simplify: bool = false)
- create_debug_tangents()
- create_multiple_convex_collisions(settings: MeshConvexDecompositionSettings = null)
- create_trimesh_collision()
- find_blend_shape_by_name(name: StringName) -> int
- get_active_material(surface: int) -> Material
- get_blend_shape_count() -> int
- get_blend_shape_value(blend_shape_idx: int) -> float
- get_skin_reference() -> SkinReference
- get_surface_override_material(surface: int) -> Material
- get_surface_override_material_count() -> int
- set_blend_shape_value(blend_shape_idx: int, value: float)
- set_surface_override_material(surface: int, material: Material)
