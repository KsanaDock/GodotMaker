## Mesh <- Resource

**Props:**
- lightmap_size_hint: Vector2i = Vector2i(0, 0)

**Methods:**
- create_convex_shape(clean: bool = true, simplify: bool = false) -> ConvexPolygonShape3D
- create_outline(margin: float) -> Mesh
- create_placeholder() -> Resource
- create_trimesh_shape() -> ConcavePolygonShape3D
- generate_triangle_mesh() -> TriangleMesh
- get_aabb() -> AABB
- get_faces() -> PackedVector3Array
- get_surface_count() -> int
- surface_get_arrays(surf_idx: int) -> Array
- surface_get_blend_shape_arrays(surf_idx: int) -> Array[]
- surface_get_material(surf_idx: int) -> Material
- surface_set_material(surf_idx: int, material: Material)
