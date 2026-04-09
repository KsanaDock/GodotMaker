## Callable

**Ctors:**
- Callable()
- Callable(from: Callable)
- Callable(object: Object, method: StringName)

**Methods:**
- bind() -> Callable
- bindv(arguments: Array) -> Callable
- call() -> Variant
- call_deferred()
- callv(arguments: Array) -> Variant
- create(variant: Variant, method: StringName) -> Callable
- get_argument_count() -> int
- get_bound_arguments() -> Array
- get_bound_arguments_count() -> int
- get_method() -> StringName
- get_object() -> Object
- get_object_id() -> int
- get_unbound_arguments_count() -> int
- hash() -> int
- is_custom() -> bool
- is_null() -> bool
- is_standard() -> bool
- is_valid() -> bool
- rpc()
- rpc_id(peer_id: int)
- unbind(argcount: int) -> Callable

**Operators:**
- operator !=
- operator ==
