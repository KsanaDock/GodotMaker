## Resource <- RefCounted

**Props:**
- resource_local_to_scene: bool = false
- resource_name: String = ""
- resource_path: String = ""
- resource_scene_unique_id: String

**Methods:**
- copy_from_resource(resource: Resource) -> int
- duplicate(deep: bool = false) -> Resource
- duplicate_deep(deep_subresources_mode: int = 1) -> Resource
- emit_changed()
- generate_scene_unique_id() -> String
- get_id_for_path(path: String) -> String
- get_local_scene() -> Node
- get_rid() -> RID
- is_built_in() -> bool
- reset_state()
- set_id_for_path(path: String, id: String)
- set_path_cache(path: String)
- setup_local_to_scene()
- take_over_path(path: String)

**Signals:**
- changed
- setup_local_to_scene_requested
