## AnimationNodeTransition <- AnimationNodeSync

**Props:**
- allow_transition_to_self: bool = false
- input_count: int = 0
- xfade_curve: Curve
- xfade_time: float = 0.0

**Methods:**
- is_input_loop_broken_at_end(input: int) -> bool
- is_input_reset(input: int) -> bool
- is_input_set_as_auto_advance(input: int) -> bool
- set_input_as_auto_advance(input: int, enable: bool)
- set_input_break_loop_at_end(input: int, enable: bool)
- set_input_reset(input: int, enable: bool)
