## DirAccess <- RefCounted

**Props:**
- include_hidden: bool
- include_navigational: bool

**Methods:**
- change_dir(to_dir: String) -> int
- copy(from: String, to: String, chmod_flags: int = -1) -> int
- copy_absolute(from: String, to: String, chmod_flags: int = -1) -> int
- create_link(source: String, target: String) -> int
- create_temp(prefix: String = "", keep: bool = false) -> DirAccess
- current_is_dir() -> bool
- dir_exists(path: String) -> bool
- dir_exists_absolute(path: String) -> bool
- file_exists(path: String) -> bool
- get_current_dir(include_drive: bool = true) -> String
- get_current_drive() -> int
- get_directories() -> PackedStringArray
- get_directories_at(path: String) -> PackedStringArray
- get_drive_count() -> int
- get_drive_label(idx: int) -> String
- get_drive_name(idx: int) -> String
- get_files() -> PackedStringArray
- get_files_at(path: String) -> PackedStringArray
- get_filesystem_type() -> String
- get_next() -> String
- get_open_error() -> int
- get_space_left() -> int
- is_bundle(path: String) -> bool
- is_case_sensitive(path: String) -> bool
- is_equivalent(path_a: String, path_b: String) -> bool
- is_link(path: String) -> bool
- list_dir_begin() -> int
- list_dir_end()
- make_dir(path: String) -> int
- make_dir_absolute(path: String) -> int
- make_dir_recursive(path: String) -> int
- make_dir_recursive_absolute(path: String) -> int
- open(path: String) -> DirAccess
- read_link(path: String) -> String
- remove(path: String) -> int
- remove_absolute(path: String) -> int
- rename(from: String, to: String) -> int
- rename_absolute(from: String, to: String) -> int
