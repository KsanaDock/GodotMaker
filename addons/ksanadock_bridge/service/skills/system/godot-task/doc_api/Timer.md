## Timer <- Node

**Props:**
- autostart: bool = false
- ignore_time_scale: bool = false
- one_shot: bool = false
- paused: bool
- process_callback: int = 1
- time_left: float
- wait_time: float = 1.0

**Methods:**
- is_stopped() -> bool
- start(time_sec: float = -1)
- stop()

**Signals:**
- timeout
