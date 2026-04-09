## EditorNode3DGizmo <- Node3DGizmo

**Methods:**
- add_collision_segments(segments: PackedVector3Array)
- add_collision_triangles(triangles: TriangleMesh)
- add_handles(handles: PackedVector3Array, material: Material, ids: PackedInt32Array, billboard: bool = false, secondary: bool = false)
- add_lines(lines: PackedVector3Array, material: Material, billboard: bool = false, modulate: Color = Color(1, 1, 1, 1))
- add_mesh(mesh: Mesh, material: Material = null, transform: Transform3D = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0), skeleton: SkinReference = null)
- add_unscaled_billboard(material: Material, default_scale: float = 1, modulate: Color = Color(1, 1, 1, 1))
- clear()
- get_node_3d() -> Node3D
- get_plugin() -> EditorNode3DGizmoPlugin
- get_subgizmo_selection() -> PackedInt32Array
- is_subgizmo_selected(id: int) -> bool
- set_hidden(hidden: bool)
- set_node_3d(node: Node)
