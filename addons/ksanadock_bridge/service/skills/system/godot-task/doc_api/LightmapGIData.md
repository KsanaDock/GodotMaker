## LightmapGIData <- Resource

**Props:**
- light_texture: TextureLayered
- lightmap_textures: TextureLayered[] = []
- shadowmask_textures: TextureLayered[] = []

**Methods:**
- add_user(path: NodePath, uv_scale: Rect2, slice_index: int, sub_instance: int)
- clear_users()
- get_user_count() -> int
- get_user_path(user_idx: int) -> NodePath
- is_using_spherical_harmonics() -> bool
- set_uses_spherical_harmonics(uses_spherical_harmonics: bool)
