## CameraFeed <- RefCounted

**Props:**
- feed_is_active: bool = false
- feed_transform: Transform2D = Transform2D(1, 0, 0, -1, 0, 1)
- formats: Array = []

**Methods:**
- get_datatype() -> int
- get_id() -> int
- get_name() -> String
- get_position() -> int
- get_texture_tex_id(feed_image_type: int) -> int
- set_external(width: int, height: int)
- set_format(index: int, parameters: Dictionary) -> bool
- set_name(name: String)
- set_position(position: int)
- set_rgb_image(rgb_image: Image)
- set_ycbcr_image(ycbcr_image: Image)
- set_ycbcr_images(y_image: Image, cbcr_image: Image)

**Signals:**
- format_changed
- frame_changed
