## Decal <- VisualInstance3D

**Props:**
- albedo_mix: float = 1.0
- cull_mask: int = 1048575
- distance_fade_begin: float = 40.0
- distance_fade_enabled: bool = false
- distance_fade_length: float = 10.0
- emission_energy: float = 1.0
- lower_fade: float = 0.3
- modulate: Color = Color(1, 1, 1, 1)
- normal_fade: float = 0.0
- size: Vector3 = Vector3(2, 2, 2)
- texture_albedo: Texture2D
- texture_emission: Texture2D
- texture_normal: Texture2D
- texture_orm: Texture2D
- upper_fade: float = 0.3

**Methods:**
- get_texture(type: int) -> Texture2D
- set_texture(type: int, texture: Texture2D)
