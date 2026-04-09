## EditorExportPlatform <- RefCounted

**Methods:**
- add_message(type: int, category: String, message: String)
- clear_messages()
- create_preset() -> EditorExportPreset
- export_pack(preset: EditorExportPreset, debug: bool, path: String, flags: int = 0) -> int
- export_pack_patch(preset: EditorExportPreset, debug: bool, path: String, patches: PackedStringArray = PackedStringArray(), flags: int = 0) -> int
- export_project(preset: EditorExportPreset, debug: bool, path: String, flags: int = 0) -> int
- export_project_files(preset: EditorExportPreset, debug: bool, save_cb: Callable, shared_cb: Callable = Callable()) -> int
- export_zip(preset: EditorExportPreset, debug: bool, path: String, flags: int = 0) -> int
- export_zip_patch(preset: EditorExportPreset, debug: bool, path: String, patches: PackedStringArray = PackedStringArray(), flags: int = 0) -> int
- find_export_template(template_file_name: String) -> Dictionary
- gen_export_flags(flags: int) -> PackedStringArray
- get_current_presets() -> Array
- get_forced_export_files(preset: EditorExportPreset = null) -> PackedStringArray
- get_internal_export_files(preset: EditorExportPreset, debug: bool) -> Dictionary
- get_message_category(index: int) -> String
- get_message_count() -> int
- get_message_text(index: int) -> String
- get_message_type(index: int) -> int
- get_os_name() -> String
- get_worst_message_type() -> int
- save_pack(preset: EditorExportPreset, debug: bool, path: String, embed: bool = false) -> Dictionary
- save_pack_patch(preset: EditorExportPreset, debug: bool, path: String) -> Dictionary
- save_zip(preset: EditorExportPreset, debug: bool, path: String) -> Dictionary
- save_zip_patch(preset: EditorExportPreset, debug: bool, path: String) -> Dictionary
- ssh_push_to_remote(host: String, port: String, scp_args: PackedStringArray, src_file: String, dst_file: String) -> int
- ssh_run_on_remote(host: String, port: String, ssh_arg: PackedStringArray, cmd_args: String, output: Array = [], port_fwd: int = -1) -> int
- ssh_run_on_remote_no_wait(host: String, port: String, ssh_args: PackedStringArray, cmd_args: String, port_fwd: int = -1) -> int
