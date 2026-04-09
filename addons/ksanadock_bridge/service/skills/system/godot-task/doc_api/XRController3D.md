## XRController3D <- XRNode3D

**Methods:**
- get_float(name: StringName) -> float
- get_input(name: StringName) -> Variant
- get_tracker_hand() -> int
- get_vector2(name: StringName) -> Vector2
- is_button_pressed(name: StringName) -> bool

**Signals:**
- button_pressed(name: String)
- button_released(name: String)
- input_float_changed(name: String, value: float)
- input_vector2_changed(name: String, value: Vector2)
- profile_changed(role: String)
