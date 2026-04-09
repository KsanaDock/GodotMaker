## Label3D <- GeometryInstance3D

**Props:**
- alpha_antialiasing_edge: float = 0.0
- alpha_antialiasing_mode: int = 0
- alpha_cut: int = 0
- alpha_hash_scale: float = 1.0
- alpha_scissor_threshold: float = 0.5
- autowrap_mode: int = 0
- autowrap_trim_flags: int = 192
- billboard: int = 0
- cast_shadow: int = 0
- double_sided: bool = true
- fixed_size: bool = false
- font: Font
- font_size: int = 32
- gi_mode: int = 0
- horizontal_alignment: int = 1
- justification_flags: int = 163
- language: String = ""
- line_spacing: float = 0.0
- modulate: Color = Color(1, 1, 1, 1)
- no_depth_test: bool = false
- offset: Vector2 = Vector2(0, 0)
- outline_modulate: Color = Color(0, 0, 0, 1)
- outline_render_priority: int = -1
- outline_size: int = 12
- pixel_size: float = 0.005
- render_priority: int = 0
- shaded: bool = false
- structured_text_bidi_override: int = 0
- structured_text_bidi_override_options: Array = []
- text: String = ""
- text_direction: int = 0
- texture_filter: int = 3
- uppercase: bool = false
- vertical_alignment: int = 1
- width: float = 500.0

**Methods:**
- generate_triangle_mesh() -> TriangleMesh
- get_draw_flag(flag: int) -> bool
- set_draw_flag(flag: int, enabled: bool)
