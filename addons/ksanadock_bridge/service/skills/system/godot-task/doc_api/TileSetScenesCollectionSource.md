## TileSetScenesCollectionSource <- TileSetSource

**Methods:**
- create_scene_tile(packed_scene: PackedScene, id_override: int = -1) -> int
- get_next_scene_tile_id() -> int
- get_scene_tile_display_placeholder(id: int) -> bool
- get_scene_tile_id(index: int) -> int
- get_scene_tile_scene(id: int) -> PackedScene
- get_scene_tiles_count() -> int
- has_scene_tile_id(id: int) -> bool
- remove_scene_tile(id: int)
- set_scene_tile_display_placeholder(id: int, display_placeholder: bool)
- set_scene_tile_id(id: int, new_id: int)
- set_scene_tile_scene(id: int, packed_scene: PackedScene)
