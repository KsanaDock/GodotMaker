## Label <- Control

**Props:**
- autowrap_mode: int = 0
- autowrap_trim_flags: int = 192
- clip_text: bool = false
- ellipsis_char: String = "…"
- horizontal_alignment: int = 0
- justification_flags: int = 163
- label_settings: LabelSettings
- language: String = ""
- lines_skipped: int = 0
- max_lines_visible: int = -1
- mouse_filter: int = 2
- paragraph_separator: String = "\\n"
- size_flags_vertical: int = 4
- structured_text_bidi_override: int = 0
- structured_text_bidi_override_options: Array = []
- tab_stops: PackedFloat32Array = PackedFloat32Array()
- text: String = ""
- text_direction: int = 0
- text_overrun_behavior: int = 0
- uppercase: bool = false
- vertical_alignment: int = 0
- visible_characters: int = -1
- visible_characters_behavior: int = 0
- visible_ratio: float = 1.0

**Methods:**
- get_character_bounds(pos: int) -> Rect2
- get_line_count() -> int
- get_line_height(line: int = -1) -> int
- get_total_character_count() -> int
- get_visible_line_count() -> int
