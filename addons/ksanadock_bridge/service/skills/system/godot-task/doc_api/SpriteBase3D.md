## SpriteBase3D <- GeometryInstance3D

**Props:**
- alpha_antialiasing_edge: float = 0.0
- alpha_antialiasing_mode: int = 0
- alpha_cut: int = 0
- alpha_hash_scale: float = 1.0
- alpha_scissor_threshold: float = 0.5
- axis: int = 2
- billboard: int = 0
- centered: bool = true
- double_sided: bool = true
- fixed_size: bool = false
- flip_h: bool = false
- flip_v: bool = false
- modulate: Color = Color(1, 1, 1, 1)
- no_depth_test: bool = false
- offset: Vector2 = Vector2(0, 0)
- pixel_size: float = 0.01
- render_priority: int = 0
- shaded: bool = false
- texture_filter: int = 3
- transparent: bool = true

**Methods:**
- generate_triangle_mesh() -> TriangleMesh
- get_draw_flag(flag: int) -> bool
- get_item_rect() -> Rect2
- set_draw_flag(flag: int, enabled: bool)
