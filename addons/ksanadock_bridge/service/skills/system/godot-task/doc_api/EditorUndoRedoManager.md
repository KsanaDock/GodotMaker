## EditorUndoRedoManager <- Object

**Methods:**
- add_do_method(object: Object, method: StringName)
- add_do_property(object: Object, property: StringName, value: Variant)
- add_do_reference(object: Object)
- add_undo_method(object: Object, method: StringName)
- add_undo_property(object: Object, property: StringName, value: Variant)
- add_undo_reference(object: Object)
- clear_history(id: int = -99, increase_version: bool = true)
- commit_action(execute: bool = true)
- create_action(name: String, merge_mode: int = 0, custom_context: Object = null, backward_undo_ops: bool = false, mark_unsaved: bool = true)
- force_fixed_history()
- get_history_undo_redo(id: int) -> UndoRedo
- get_object_history_id(object: Object) -> int
- is_committing_action() -> bool

**Signals:**
- history_changed
- version_changed
