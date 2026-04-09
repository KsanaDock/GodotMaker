## EditorDebuggerSession <- RefCounted

**Methods:**
- add_session_tab(control: Control)
- is_active() -> bool
- is_breaked() -> bool
- is_debuggable() -> bool
- remove_session_tab(control: Control)
- send_message(message: String, data: Array = [])
- set_breakpoint(path: String, line: int, enabled: bool)
- toggle_profiler(profiler: String, enable: bool, data: Array = [])

**Signals:**
- breaked(can_debug: bool)
- continued
- started
- stopped
