## Node2D <- CanvasItem

**Props:**
- global_position: Vector2
- global_rotation: float
- global_rotation_degrees: float
- global_scale: Vector2
- global_skew: float
- global_transform: Transform2D
- position: Vector2 = Vector2(0, 0)
- rotation: float = 0.0
- rotation_degrees: float
- scale: Vector2 = Vector2(1, 1)
- skew: float = 0.0
- transform: Transform2D

**Methods:**
- apply_scale(ratio: Vector2)
- get_angle_to(point: Vector2) -> float
- get_relative_transform_to_parent(parent: Node) -> Transform2D
- global_translate(offset: Vector2)
- look_at(point: Vector2)
- move_local_x(delta: float, scaled: bool = false)
- move_local_y(delta: float, scaled: bool = false)
- rotate(radians: float)
- to_global(local_point: Vector2) -> Vector2
- to_local(global_point: Vector2) -> Vector2
- translate(offset: Vector2)
