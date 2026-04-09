## DPITexture <- Texture2D

**Props:**
- base_scale: float = 1.0
- color_map: Dictionary = {}
- fix_alpha_border: bool = false
- premult_alpha: bool = false
- resource_local_to_scene: bool = false
- saturation: float = 1.0

**Methods:**
- create_from_string(source: String, scale: float = 1.0, saturation: float = 1.0, color_map: Dictionary = {}) -> DPITexture
- get_scaled_rid() -> RID
- get_source() -> String
- set_size_override(size: Vector2i)
- set_source(source: String)
