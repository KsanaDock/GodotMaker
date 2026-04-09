## HingeJoint3D <- Joint3D

**Props:**
- angular_limit/bias: float = 0.3
- angular_limit/enable: bool = false
- angular_limit/lower: float = -1.5707964
- angular_limit/relaxation: float = 1.0
- angular_limit/softness: float = 0.9
- angular_limit/upper: float = 1.5707964
- motor/enable: bool = false
- motor/max_impulse: float = 1.0
- motor/target_velocity: float = 1.0
- params/bias: float = 0.3

**Methods:**
- get_flag(flag: int) -> bool
- get_param(param: int) -> float
- set_flag(flag: int, enabled: bool)
- set_param(param: int, value: float)
