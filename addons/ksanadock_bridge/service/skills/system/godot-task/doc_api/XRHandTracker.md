## XRHandTracker <- XRPositionalTracker

**Props:**
- hand: int = 1
- hand_tracking_source: int = 0
- has_tracking_data: bool = false
- type: int = 16

**Methods:**
- get_hand_joint_angular_velocity(joint: int) -> Vector3
- get_hand_joint_flags(joint: int) -> int
- get_hand_joint_linear_velocity(joint: int) -> Vector3
- get_hand_joint_radius(joint: int) -> float
- get_hand_joint_transform(joint: int) -> Transform3D
- set_hand_joint_angular_velocity(joint: int, angular_velocity: Vector3)
- set_hand_joint_flags(joint: int, flags: int)
- set_hand_joint_linear_velocity(joint: int, linear_velocity: Vector3)
- set_hand_joint_radius(joint: int, radius: float)
- set_hand_joint_transform(joint: int, transform: Transform3D)
