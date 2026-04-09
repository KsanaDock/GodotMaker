## Gradient <- Resource

**Props:**
- colors: PackedColorArray = PackedColorArray(0, 0, 0, 1, 1, 1, 1, 1)
- interpolation_color_space: int = 0
- interpolation_mode: int = 0
- offsets: PackedFloat32Array = PackedFloat32Array(0, 1)

**Methods:**
- add_point(offset: float, color: Color)
- get_color(point: int) -> Color
- get_offset(point: int) -> float
- get_point_count() -> int
- remove_point(point: int)
- reverse()
- sample(offset: float) -> Color
- set_color(point: int, color: Color)
- set_offset(point: int, offset: float)
