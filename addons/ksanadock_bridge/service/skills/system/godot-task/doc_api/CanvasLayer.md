## CanvasLayer <- Node

**Props:**
- custom_viewport: Node
- follow_viewport_enabled: bool = false
- follow_viewport_scale: float = 1.0
- layer: int = 1
- offset: Vector2 = Vector2(0, 0)
- rotation: float = 0.0
- scale: Vector2 = Vector2(1, 1)
- transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0)
- visible: bool = true

**Methods:**
- get_canvas() -> RID
- get_final_transform() -> Transform2D
- hide()
- show()

**Signals:**
- visibility_changed
