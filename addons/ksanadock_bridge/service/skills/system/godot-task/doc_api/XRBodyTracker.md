## XRBodyTracker <- XRPositionalTracker

**Props:**
- body_flags: int = 0
- has_tracking_data: bool = false
- type: int = 32

**Methods:**
- get_joint_flags(joint: int) -> int
- get_joint_transform(joint: int) -> Transform3D
- set_joint_flags(joint: int, flags: int)
- set_joint_transform(joint: int, transform: Transform3D)
