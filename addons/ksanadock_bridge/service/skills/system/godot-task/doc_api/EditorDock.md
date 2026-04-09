## EditorDock <- MarginContainer

**Props:**
- available_layouts: int = 5
- closable: bool = false
- default_slot: int = -1
- dock_icon: Texture2D
- dock_shortcut: Shortcut
- force_show_icon: bool = false
- global: bool = true
- icon_name: StringName = &""
- layout_key: String = ""
- title: String = ""
- title_color: Color = Color(0, 0, 0, 0)
- transient: bool = false

**Methods:**
- close()
- make_visible()
- open()

**Signals:**
- closed
- opened
