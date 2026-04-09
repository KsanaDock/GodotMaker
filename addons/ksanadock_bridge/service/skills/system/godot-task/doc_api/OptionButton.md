## OptionButton <- Button

**Props:**
- action_mode: int = 0
- alignment: int = 0
- allow_reselect: bool = false
- enable_search_bar_on_item_count: int = 0
- fit_to_longest_item: bool = true
- item_count: int = 0
- popup/item_{index}/disabled: bool = false
- popup/item_{index}/icon: Texture2D
- popup/item_{index}/id: int = 0
- popup/item_{index}/separator: bool = false
- popup/item_{index}/text: String = ""
- selected: int = -1
- toggle_mode: bool = true

**Methods:**
- add_icon_item(texture: Texture2D, label: String, id: int = -1)
- add_item(label: String, id: int = -1)
- add_separator(text: String = "")
- clear()
- get_item_auto_translate_mode(idx: int) -> int
- get_item_icon(idx: int) -> Texture2D
- get_item_id(idx: int) -> int
- get_item_index(id: int) -> int
- get_item_metadata(idx: int) -> Variant
- get_item_text(idx: int) -> String
- get_item_tooltip(idx: int) -> String
- get_popup() -> PopupMenu
- get_selectable_item(from_last: bool = false) -> int
- get_selected_id() -> int
- get_selected_metadata() -> Variant
- has_selectable_items() -> bool
- is_item_disabled(idx: int) -> bool
- is_item_separator(idx: int) -> bool
- is_search_bar_enabled() -> bool
- remove_item(idx: int)
- select(idx: int)
- set_disable_shortcuts(disabled: bool)
- set_item_auto_translate_mode(idx: int, mode: int)
- set_item_disabled(idx: int, disabled: bool)
- set_item_icon(idx: int, texture: Texture2D)
- set_item_id(idx: int, id: int)
- set_item_metadata(idx: int, metadata: Variant)
- set_item_text(idx: int, text: String)
- set_item_tooltip(idx: int, tooltip: String)
- show_popup()

**Signals:**
- item_focused(index: int)
- item_selected(index: int)
