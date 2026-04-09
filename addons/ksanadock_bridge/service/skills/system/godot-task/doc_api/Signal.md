## Signal

**Ctors:**
- Signal()
- Signal(from: Signal)
- Signal(object: Object, signal: StringName)

**Methods:**
- connect(callable: Callable, flags: int = 0) -> int
- disconnect(callable: Callable)
- emit()
- get_connections() -> Array
- get_name() -> StringName
- get_object() -> Object
- get_object_id() -> int
- has_connections() -> bool
- is_connected(callable: Callable) -> bool
- is_null() -> bool

**Operators:**
- operator !=
- operator ==
