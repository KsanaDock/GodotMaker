## ResourceSaver <- Object

**Methods:**
- add_resource_format_saver(format_saver: ResourceFormatSaver, at_front: bool = false)
- get_recognized_extensions(type: Resource) -> PackedStringArray
- get_resource_id_for_path(path: String, generate: bool = false) -> int
- remove_resource_format_saver(format_saver: ResourceFormatSaver)
- save(resource: Resource, path: String = "", flags: int = 0) -> int
- set_uid(resource: String, uid: int) -> int
