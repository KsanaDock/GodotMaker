## XRNode3D <- Node3D

**Props:**
- physics_interpolation_mode: int = 2
- pose: StringName = &"default"
- show_when_tracked: bool = false
- tracker: StringName = &""

**Methods:**
- get_has_tracking_data() -> bool
- get_is_active() -> bool
- get_pose() -> XRPose
- trigger_haptic_pulse(action_name: String, frequency: float, amplitude: float, duration_sec: float, delay_sec: float)

**Signals:**
- tracking_changed(tracking: bool)
