## ColorPickerButton <- Button

**Props:**
- color: Color = Color(0, 0, 0, 1)
- edit_alpha: bool = true
- edit_intensity: bool = true
- toggle_mode: bool = true

**Methods:**
- get_picker() -> ColorPicker
- get_popup() -> PopupPanel

**Signals:**
- color_changed(color: Color)
- picker_created
- popup_closed
