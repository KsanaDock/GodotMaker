## HeightMapShape3D <- Shape3D

**Props:**
- map_data: PackedFloat32Array = PackedFloat32Array(0, 0, 0, 0)
- map_depth: int = 2
- map_width: int = 2

**Methods:**
- get_max_height() -> float
- get_min_height() -> float
- update_map_data_from_image(image: Image, height_min: float, height_max: float)
