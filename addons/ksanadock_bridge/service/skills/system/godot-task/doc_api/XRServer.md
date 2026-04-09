## XRServer <- Object

**Props:**
- camera_locked_to_origin: bool = false
- primary_interface: XRInterface
- world_origin: Transform3D = Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0)
- world_scale: float = 1.0

**Methods:**
- add_interface(interface: XRInterface)
- add_tracker(tracker: XRTracker)
- center_on_hmd(rotation_mode: int, keep_height: bool)
- clear_reference_frame()
- find_interface(name: String) -> XRInterface
- get_hmd_transform() -> Transform3D
- get_interface(idx: int) -> XRInterface
- get_interface_count() -> int
- get_interfaces() -> Dictionary[]
- get_reference_frame() -> Transform3D
- get_tracker(tracker_name: StringName) -> XRTracker
- get_trackers(tracker_types: int) -> Dictionary
- remove_interface(interface: XRInterface)
- remove_tracker(tracker: XRTracker)

**Signals:**
- interface_added(interface_name: StringName)
- interface_removed(interface_name: StringName)
- reference_frame_changed
- tracker_added(tracker_name: StringName, type: int)
- tracker_removed(tracker_name: StringName, type: int)
- tracker_updated(tracker_name: StringName, type: int)
- world_origin_changed
