## WorkerThreadPool <- Object

**Methods:**
- add_group_task(action: Callable, elements: int, tasks_needed: int = -1, high_priority: bool = false, description: String = "") -> int
- add_task(action: Callable, high_priority: bool = false, description: String = "") -> int
- get_caller_group_id() -> int
- get_caller_task_id() -> int
- get_group_processed_element_count(group_id: int) -> int
- is_group_task_completed(group_id: int) -> bool
- is_task_completed(task_id: int) -> bool
- wait_for_group_task_completion(group_id: int)
- wait_for_task_completion(task_id: int) -> int
