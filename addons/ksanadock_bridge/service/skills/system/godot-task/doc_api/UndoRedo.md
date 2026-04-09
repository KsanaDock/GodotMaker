## UndoRedo <- Object

**Props:**
- max_steps: int = 0

**Methods:**
- add_do_method(callable: Callable)
- add_do_property(object: Object, property: StringName, value: Variant)
- add_do_reference(object: Object)
- add_undo_method(callable: Callable)
- add_undo_property(object: Object, property: StringName, value: Variant)
- add_undo_reference(object: Object)
- clear_history(increase_version: bool = true)
- commit_action(execute: bool = true)
- create_action(name: String, merge_mode: int = 0, backward_undo_ops: bool = false)
- end_force_keep_in_merge_ends()
- get_action_name(id: int) -> String
- get_current_action() -> int
- get_current_action_name() -> String
- get_history_count() -> int
- get_version() -> int
- has_redo() -> bool
- has_undo() -> bool
- is_committing_action() -> bool
- redo() -> bool
- start_force_keep_in_merge_ends()
- undo() -> bool

**Signals:**
- version_changed
