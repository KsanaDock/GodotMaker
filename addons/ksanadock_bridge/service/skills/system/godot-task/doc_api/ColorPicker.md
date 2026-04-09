## ColorPicker <- VBoxContainer

**Props:**
- can_add_swatches: bool = true
- color: Color = Color(1, 1, 1, 1)
- color_mode: int = 0
- color_modes_visible: bool = true
- deferred_mode: bool = false
- edit_alpha: bool = true
- edit_intensity: bool = true
- hex_visible: bool = true
- picker_shape: int = 0
- presets_visible: bool = true
- sampler_visible: bool = true
- sliders_visible: bool = true

**Methods:**
- add_preset(color: Color)
- add_recent_preset(color: Color)
- erase_preset(color: Color)
- erase_recent_preset(color: Color)
- get_presets() -> PackedColorArray
- get_recent_presets() -> PackedColorArray

**Signals:**
- color_changed(color: Color)
- preset_added(color: Color)
- preset_removed(color: Color)
