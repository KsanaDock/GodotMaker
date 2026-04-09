## FoldableContainer <- Container

**Props:**
- focus_mode: int = 2
- foldable_group: FoldableGroup
- folded: bool = false
- language: String = ""
- mouse_filter: int = 0
- title: String = ""
- title_alignment: int = 0
- title_position: int = 0
- title_text_direction: int = 0
- title_text_overrun_behavior: int = 0

**Methods:**
- add_title_bar_control(control: Control)
- expand()
- fold()
- remove_title_bar_control(control: Control)

**Signals:**
- folding_changed(is_folded: bool)
