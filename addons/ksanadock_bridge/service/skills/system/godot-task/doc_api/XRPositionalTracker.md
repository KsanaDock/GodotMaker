## XRPositionalTracker <- XRTracker

**Props:**
- hand: int = 0
- profile: String = ""

**Methods:**
- get_input(name: StringName) -> Variant
- get_pose(name: StringName) -> XRPose
- has_pose(name: StringName) -> bool
- invalidate_pose(name: StringName)
- set_input(name: StringName, value: Variant)
- set_pose(name: StringName, transform: Transform3D, linear_velocity: Vector3, angular_velocity: Vector3, tracking_confidence: int)

**Signals:**
- button_pressed(name: String)
- button_released(name: String)
- input_float_changed(name: String, value: float)
- input_vector2_changed(name: String, vector: Vector2)
- pose_changed(pose: XRPose)
- pose_lost_tracking(pose: XRPose)
- profile_changed(role: String)
