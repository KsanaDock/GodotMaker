## BaseButton <- Control

**Props:**
- action_mode: int = 1
- button_group: ButtonGroup
- button_mask: int = 1
- button_pressed: bool = false
- disabled: bool = false
- focus_mode: int = 2
- keep_pressed_outside: bool = false
- shortcut: Shortcut
- shortcut_feedback: bool = true
- shortcut_in_tooltip: bool = true
- toggle_mode: bool = false

**Methods:**
- get_draw_mode() -> int
- is_hovered() -> bool
- set_pressed_no_signal(pressed: bool)

**Signals:**
- button_down
- button_up
- pressed
- toggled(toggled_on: bool)
