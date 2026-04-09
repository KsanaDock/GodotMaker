## Light3D <- VisualInstance3D

**Props:**
- distance_fade_begin: float = 40.0
- distance_fade_enabled: bool = false
- distance_fade_length: float = 10.0
- distance_fade_shadow: float = 50.0
- editor_only: bool = false
- light_angular_distance: float = 0.0
- light_bake_mode: int = 2
- light_color: Color = Color(1, 1, 1, 1)
- light_cull_mask: int = 4294967295
- light_energy: float = 1.0
- light_indirect_energy: float = 1.0
- light_intensity_lumens: float
- light_intensity_lux: float
- light_negative: bool = false
- light_projector: Texture2D
- light_size: float = 0.0
- light_specular: float = 1.0
- light_temperature: float
- light_volumetric_fog_energy: float = 1.0
- shadow_bias: float = 0.1
- shadow_blur: float = 1.0
- shadow_caster_mask: int = 4294967295
- shadow_enabled: bool = false
- shadow_normal_bias: float = 2.0
- shadow_opacity: float = 1.0
- shadow_reverse_cull_face: bool = false
- shadow_transmittance_bias: float = 0.05

**Methods:**
- get_correlated_color() -> Color
- get_param(param: int) -> float
- set_param(param: int, value: float)
