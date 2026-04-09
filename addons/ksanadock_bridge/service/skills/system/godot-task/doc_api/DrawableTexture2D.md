## DrawableTexture2D <- Texture2D

**Props:**
- resource_local_to_scene: bool = false

**Methods:**
- blit_rect(rect: Rect2i, source: Texture2D, modulate: Color = Color(1, 1, 1, 1), mipmap: int = 0, material: Material = null)
- blit_rect_multi(rect: Rect2i, sources: Texture2D[], extra_targets: DrawableTexture2D[], modulate: Color = Color(1, 1, 1, 1), mipmap: int = 0, material: Material = null)
- generate_mipmaps()
- get_use_mipmaps() -> bool
- set_format(format: int)
- set_height(height: int)
- set_use_mipmaps(mipmaps: bool)
- set_width(width: int)
- setup(width: int, height: int, format: int, color: Color = Color(1, 1, 1, 1), use_mipmaps: bool = false)
