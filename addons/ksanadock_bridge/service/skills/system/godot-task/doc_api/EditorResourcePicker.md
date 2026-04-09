## EditorResourcePicker <- HBoxContainer

**Props:**
- base_type: String = ""
- editable: bool = true
- edited_resource: Resource
- toggle_mode: bool = false

**Methods:**
- get_allowed_types() -> PackedStringArray
- set_toggle_pressed(pressed: bool)

**Signals:**
- resource_changed(resource: Resource)
- resource_selected(resource: Resource, inspect: bool)
