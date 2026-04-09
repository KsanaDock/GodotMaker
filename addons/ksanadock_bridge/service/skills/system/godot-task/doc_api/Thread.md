## Thread <- RefCounted

**Methods:**
- get_id() -> String
- is_alive() -> bool
- is_main_thread() -> bool
- is_started() -> bool
- set_thread_safety_checks_enabled(enabled: bool)
- start(callable: Callable, priority: int = 1) -> int
- wait_to_finish() -> Variant
