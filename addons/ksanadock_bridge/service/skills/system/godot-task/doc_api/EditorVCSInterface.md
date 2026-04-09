## EditorVCSInterface <- Object

**Methods:**
- add_diff_hunks_into_diff_file(diff_file: Dictionary, diff_hunks: Dictionary[]) -> Dictionary
- add_line_diffs_into_diff_hunk(diff_hunk: Dictionary, line_diffs: Dictionary[]) -> Dictionary
- create_commit(msg: String, author: String, id: String, unix_timestamp: int, offset_minutes: int) -> Dictionary
- create_diff_file(new_file: String, old_file: String) -> Dictionary
- create_diff_hunk(old_start: int, new_start: int, old_lines: int, new_lines: int) -> Dictionary
- create_diff_line(new_line_no: int, old_line_no: int, content: String, status: String) -> Dictionary
- create_status_file(file_path: String, change_type: int, area: int) -> Dictionary
- popup_error(msg: String)
