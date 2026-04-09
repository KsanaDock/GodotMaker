## AnimationPlayer <- AnimationMixer

**Props:**
- assigned_animation: StringName
- autoplay: StringName = &""
- current_animation: StringName = &""
- current_animation_length: float
- current_animation_position: float
- movie_quit_on_finish: bool = false
- playback_auto_capture: bool = true
- playback_auto_capture_duration: float = -1.0
- playback_auto_capture_ease_type: int = 0
- playback_auto_capture_transition_type: int = 0
- playback_default_blend_time: float = 0.0
- speed_scale: float = 1.0

**Methods:**
- animation_get_next(animation_from: StringName) -> StringName
- animation_set_next(animation_from: StringName, animation_to: StringName)
- clear_queue()
- get_blend_time(animation_from: StringName, animation_to: StringName) -> float
- get_method_call_mode() -> int
- get_playing_speed() -> float
- get_process_callback() -> int
- get_queue() -> StringName[]
- get_root() -> NodePath
- get_section_end_time() -> float
- get_section_start_time() -> float
- has_section() -> bool
- is_animation_active() -> bool
- is_playing() -> bool
- pause()
- play(name: StringName = &"", custom_blend: float = -1, custom_speed: float = 1.0, from_end: bool = false)
- play_backwards(name: StringName = &"", custom_blend: float = -1)
- play_section(name: StringName = &"", start_time: float = -1, end_time: float = -1, custom_blend: float = -1, custom_speed: float = 1.0, from_end: bool = false)
- play_section_backwards(name: StringName = &"", start_time: float = -1, end_time: float = -1, custom_blend: float = -1)
- play_section_with_markers(name: StringName = &"", start_marker: StringName = &"", end_marker: StringName = &"", custom_blend: float = -1, custom_speed: float = 1.0, from_end: bool = false)
- play_section_with_markers_backwards(name: StringName = &"", start_marker: StringName = &"", end_marker: StringName = &"", custom_blend: float = -1)
- play_with_capture(name: StringName = &"", duration: float = -1.0, custom_blend: float = -1, custom_speed: float = 1.0, from_end: bool = false, trans_type: int = 0, ease_type: int = 0)
- queue(name: StringName)
- reset_section()
- seek(seconds: float, update: bool = false, update_only: bool = false)
- set_blend_time(animation_from: StringName, animation_to: StringName, sec: float)
- set_method_call_mode(mode: int)
- set_process_callback(mode: int)
- set_root(path: NodePath)
- set_section(start_time: float = -1, end_time: float = -1)
- set_section_with_markers(start_marker: StringName = &"", end_marker: StringName = &"")
- stop(keep_state: bool = false)

**Signals:**
- animation_changed(old_name: StringName, new_name: StringName)
- current_animation_changed(name: StringName)
