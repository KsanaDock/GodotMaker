## StyleBoxTexture <- StyleBox

**Props:**
- axis_stretch_horizontal: int = 0
- axis_stretch_vertical: int = 0
- draw_center: bool = true
- expand_margin_bottom: float = 0.0
- expand_margin_left: float = 0.0
- expand_margin_right: float = 0.0
- expand_margin_top: float = 0.0
- modulate_color: Color = Color(1, 1, 1, 1)
- region_rect: Rect2 = Rect2(0, 0, 0, 0)
- texture: Texture2D
- texture_margin_bottom: float = 0.0
- texture_margin_left: float = 0.0
- texture_margin_right: float = 0.0
- texture_margin_top: float = 0.0

**Methods:**
- get_expand_margin(margin: int) -> float
- get_texture_margin(margin: int) -> float
- set_expand_margin(margin: int, size: float)
- set_expand_margin_all(size: float)
- set_texture_margin(margin: int, size: float)
- set_texture_margin_all(size: float)
