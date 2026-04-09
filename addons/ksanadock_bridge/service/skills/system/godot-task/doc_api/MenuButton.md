## MenuButton <- Button

**Props:**
- action_mode: int = 0
- flat: bool = true
- focus_mode: int = 3
- item_count: int = 0
- popup/item_{index}/checkable: int = 0
- popup/item_{index}/checked: bool = false
- popup/item_{index}/disabled: bool = false
- popup/item_{index}/icon: Texture2D
- popup/item_{index}/id: int = 0
- popup/item_{index}/separator: bool = false
- popup/item_{index}/text: String = ""
- switch_on_hover: bool = false
- toggle_mode: bool = true

**Methods:**
- get_popup() -> PopupMenu
- set_disable_shortcuts(disabled: bool)
- show_popup()

**Signals:**
- about_to_popup
