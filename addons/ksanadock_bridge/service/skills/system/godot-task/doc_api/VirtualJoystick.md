## VirtualJoystick <- Control

**Props:**
- action_down: StringName = &"ui_down"
- action_left: StringName = &"ui_left"
- action_right: StringName = &"ui_right"
- action_up: StringName = &"ui_up"
- clampzone_ratio: float = 1.0
- deadzone_ratio: float = 0.0
- initial_offset_ratio: Vector2 = Vector2(0.5, 0.5)
- joystick_mode: int = 0
- joystick_size: float = 100.0
- tip_size: float = 50.0
- visibility_mode: int = 0

**Signals:**
- flick_canceled
- flicked(input_vector: Vector2)
- pressed
- released(input_vector: Vector2)
- tapped
