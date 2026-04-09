## ScrollContainer <- Container

**Props:**
- clip_contents: bool = true
- draw_focus_border: bool = false
- follow_focus: bool = false
- horizontal_scroll_mode: int = 1
- scroll_deadzone: int = 0
- scroll_hint_mode: int = 0
- scroll_horizontal: int = 0
- scroll_horizontal_by_default: bool = false
- scroll_horizontal_custom_step: float = -1.0
- scroll_vertical: int = 0
- scroll_vertical_custom_step: float = -1.0
- tile_scroll_hint: bool = false
- vertical_scroll_mode: int = 1

**Methods:**
- ensure_control_visible(control: Control)
- get_h_scroll_bar() -> HScrollBar
- get_v_scroll_bar() -> VScrollBar

**Signals:**
- scroll_ended
- scroll_started
