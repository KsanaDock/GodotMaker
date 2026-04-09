## ResourceLoader <- Object

**Methods:**
- add_resource_format_loader(format_loader: ResourceFormatLoader, at_front: bool = false)
- exists(path: String, type_hint: String = "") -> bool
- get_cached_ref(path: String) -> Resource
- get_dependencies(path: String) -> PackedStringArray
- get_recognized_extensions_for_type(type: String) -> PackedStringArray
- get_resource_uid(path: String) -> int
- has_cached(path: String) -> bool
- list_directory(directory_path: String) -> PackedStringArray
- load(path: String, type_hint: String = "", cache_mode: int = 1) -> Resource
- load_threaded_get(path: String) -> Resource
- load_threaded_get_status(path: String, progress: Array = []) -> int
- load_threaded_request(path: String, type_hint: String = "", use_sub_threads: bool = false, cache_mode: int = 1) -> int
- remove_resource_format_loader(format_loader: ResourceFormatLoader)
- set_abort_on_missing_resources(abort: bool)
