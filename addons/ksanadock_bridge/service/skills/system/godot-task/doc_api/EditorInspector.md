## EditorInspector <- ScrollContainer

**Props:**
- draw_focus_border: bool = true
- focus_mode: int = 2
- follow_focus: bool = true
- horizontal_scroll_mode: int = 0

**Methods:**
- edit(object: Object)
- get_edited_object() -> Object
- get_selected_path() -> String
- instantiate_property_editor(object: Object, type: int, path: String, hint: int, hint_text: String, usage: int, wide: bool = false) -> EditorProperty

**Signals:**
- edited_object_changed
- object_id_selected(id: int)
- property_deleted(property: String)
- property_edited(property: String)
- property_keyed(property: String, value: Variant, advance: bool)
- property_selected(property: String)
- property_toggled(property: String, checked: bool)
- resource_selected(resource: Resource, path: String)
- restart_requested
