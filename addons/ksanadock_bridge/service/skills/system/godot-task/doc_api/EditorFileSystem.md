## EditorFileSystem <- Node

**Methods:**
- get_file_type(path: String) -> String
- get_filesystem() -> EditorFileSystemDirectory
- get_filesystem_path(path: String) -> EditorFileSystemDirectory
- get_scanning_progress() -> float
- is_importing() -> bool
- is_scanning() -> bool
- reimport_files(files: PackedStringArray)
- scan()
- scan_sources()
- update_file(path: String)

**Signals:**
- filesystem_changed
- resources_reimported(resources: PackedStringArray)
- resources_reimporting(resources: PackedStringArray)
- resources_reload(resources: PackedStringArray)
- script_classes_updated
- sources_changed(exist: bool)
