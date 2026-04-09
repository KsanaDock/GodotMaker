## FileDialog <- ConfirmationDialog

**Props:**
- access: int = 0
- current_dir: String
- current_file: String
- current_path: String
- deleting_enabled: bool = true
- dialog_hide_on_ok: bool = false
- display_mode: int = 0
- favorites_enabled: bool = true
- file_filter_toggle_enabled: bool = true
- file_mode: int = 4
- file_sort_options_enabled: bool = true
- filename_filter: String = ""
- filters: PackedStringArray = PackedStringArray()
- folder_creation_enabled: bool = true
- hidden_files_toggle_enabled: bool = true
- layout_toggle_enabled: bool = true
- mode_overrides_title: bool = true
- option_count: int = 0
- option_{index}/default: int = 0
- option_{index}/name: String = ""
- option_{index}/values: PackedStringArray = PackedStringArray()
- overwrite_warning_enabled: bool = true
- recent_list_enabled: bool = true
- root_subfolder: String = ""
- show_hidden_files: bool = false
- size: Vector2i = Vector2i(640, 360)
- title: String = "Save a File"
- use_native_dialog: bool = false

**Methods:**
- add_filter(filter: String, description: String = "", mime_type: String = "")
- add_option(name: String, values: PackedStringArray, default_value_index: int)
- clear_filename_filter()
- clear_filters()
- deselect_all()
- get_favorite_list() -> PackedStringArray
- get_line_edit() -> LineEdit
- get_option_default(option: int) -> int
- get_option_name(option: int) -> String
- get_option_values(option: int) -> PackedStringArray
- get_recent_list() -> PackedStringArray
- get_selected_options() -> Dictionary
- get_vbox() -> VBoxContainer
- invalidate()
- is_customization_flag_enabled(flag: int) -> bool
- popup_file_dialog()
- set_customization_flag_enabled(flag: int, enabled: bool)
- set_favorite_list(favorites: PackedStringArray)
- set_get_icon_callback(callback: Callable)
- set_get_thumbnail_callback(callback: Callable)
- set_option_default(option: int, default_value_index: int)
- set_option_name(option: int, name: String)
- set_option_values(option: int, values: PackedStringArray)
- set_recent_list(recents: PackedStringArray)

**Signals:**
- dir_selected(dir: String)
- file_selected(path: String)
- filename_filter_changed(filter: String)
- files_selected(paths: PackedStringArray)
