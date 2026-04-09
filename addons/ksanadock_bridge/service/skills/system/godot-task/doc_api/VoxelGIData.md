## VoxelGIData <- Resource

**Props:**
- bias: float = 1.5
- dynamic_range: float = 2.0
- energy: float = 1.0
- interior: bool = false
- normal_bias: float = 0.0
- propagation: float = 0.5
- use_two_bounces: bool = true

**Methods:**
- allocate(to_cell_xform: Transform3D, aabb: AABB, octree_size: Vector3, octree_cells: PackedByteArray, data_cells: PackedByteArray, distance_field: PackedByteArray, level_counts: PackedInt32Array)
- get_bounds() -> AABB
- get_data_cells() -> PackedByteArray
- get_level_counts() -> PackedInt32Array
- get_octree_cells() -> PackedByteArray
- get_octree_size() -> Vector3
- get_to_cell_xform() -> Transform3D
