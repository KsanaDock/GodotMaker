## Range <- Control

**Props:**
- allow_greater: bool = false
- allow_lesser: bool = false
- exp_edit: bool = false
- max_value: float = 100.0
- min_value: float = 0.0
- page: float = 0.0
- ratio: float
- rounded: bool = false
- size_flags_vertical: int = 0
- step: float = 0.01
- value: float = 0.0

**Methods:**
- set_value_no_signal(value: float)
- share(with: Node)
- unshare()

**Signals:**
- changed
- value_changed(value: float)
