## Tween <- RefCounted

**Methods:**
- bind_node(node: Node) -> Tween
- chain() -> Tween
- custom_step(delta: float) -> bool
- get_loops_left() -> int
- get_total_elapsed_time() -> float
- has_tweeners() -> bool
- interpolate_value(initial_value: Variant, delta_value: Variant, elapsed_time: float, duration: float, trans_type: int, ease_type: int) -> Variant
- is_running() -> bool
- is_valid() -> bool
- kill()
- parallel() -> Tween
- pause()
- play()
- set_ease(ease: int) -> Tween
- set_ignore_time_scale(ignore: bool = true) -> Tween
- set_loops(loops: int = 0) -> Tween
- set_parallel(parallel: bool = true) -> Tween
- set_pause_mode(mode: int) -> Tween
- set_process_mode(mode: int) -> Tween
- set_speed_scale(speed: float) -> Tween
- set_trans(trans: int) -> Tween
- stop()
- tween_await(signal: Signal) -> AwaitTweener
- tween_callback(callback: Callable) -> CallbackTweener
- tween_interval(time: float) -> IntervalTweener
- tween_method(method: Callable, from: Variant, to: Variant, duration: float) -> MethodTweener
- tween_property(object: Object, property: NodePath, final_val: Variant, duration: float) -> PropertyTweener
- tween_subtween(subtween: Tween) -> SubtweenTweener

**Signals:**
- finished
- loop_finished(loop_count: int)
- step_finished(idx: int)
