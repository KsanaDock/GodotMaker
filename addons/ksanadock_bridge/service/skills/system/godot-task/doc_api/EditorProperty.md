## EditorProperty <- Container

**Props:**
- checkable: bool = false
- checked: bool = false
- deletable: bool = false
- draw_background: bool = true
- draw_label: bool = true
- draw_warning: bool = false
- focus_mode: int = 3
- keying: bool = false
- label: String = ""
- name_split_ratio: float = 0.5
- read_only: bool = false
- selectable: bool = true
- use_folding: bool = false

**Methods:**
- add_focusable(control: Control)
- deselect()
- emit_changed(property: StringName, value: Variant, field: StringName = &"", changing: bool = false)
- get_edited_object() -> Object
- get_edited_property() -> StringName
- is_selected() -> bool
- select(focusable: int = -1)
- set_bottom_editor(editor: Control)
- set_label_reference(control: Control)
- set_object_and_property(object: Object, property: StringName)
- update_property()

**Signals:**
- multiple_properties_changed(properties: PackedStringArray, value: Array)
- object_id_selected(property: StringName, id: int)
- property_can_revert_changed(property: StringName, can_revert: bool)
- property_changed(property: StringName, value: Variant, field: StringName, changing: bool)
- property_checked(property: StringName, checked: bool)
- property_deleted(property: StringName)
- property_favorited(property: StringName, favorited: bool)
- property_keyed(property: StringName)
- property_keyed_with_value(property: StringName, value: Variant)
- property_overridden
- property_pinned(property: StringName, pinned: bool)
- resource_selected(path: String, resource: Resource)
- selected(path: String, focusable_idx: int)
