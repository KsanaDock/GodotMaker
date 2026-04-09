## GeometryInstance3D <- VisualInstance3D

**Props:**
- cast_shadow: int = 1
- custom_aabb: AABB = AABB(0, 0, 0, 0, 0, 0)
- extra_cull_margin: float = 0.0
- gi_lightmap_scale: int = 0
- gi_lightmap_texel_scale: float = 1.0
- gi_mode: int = 1
- ignore_occlusion_culling: bool = false
- lod_bias: float = 1.0
- material_overlay: Material
- material_override: Material
- transparency: float = 0.0
- visibility_range_begin: float = 0.0
- visibility_range_begin_margin: float = 0.0
- visibility_range_end: float = 0.0
- visibility_range_end_margin: float = 0.0
- visibility_range_fade_mode: int = 0

**Methods:**
- get_instance_shader_parameter(name: StringName) -> Variant
- set_instance_shader_parameter(name: StringName, value: Variant)
