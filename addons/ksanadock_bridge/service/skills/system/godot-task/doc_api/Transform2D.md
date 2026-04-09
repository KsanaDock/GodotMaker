## Transform2D

**Props:**
- origin: Vector2 = Vector2(0, 0)
- x: Vector2 = Vector2(1, 0)
- y: Vector2 = Vector2(0, 1)

**Ctors:**
- Transform2D()
- Transform2D(from: Transform2D)
- Transform2D(rotation: float, position: Vector2)
- Transform2D(rotation: float, scale: Vector2, skew: float, position: Vector2)
- Transform2D(x_axis: Vector2, y_axis: Vector2, origin: Vector2)

**Methods:**
- affine_inverse() -> Transform2D
- basis_xform(v: Vector2) -> Vector2
- basis_xform_inv(v: Vector2) -> Vector2
- determinant() -> float
- get_origin() -> Vector2
- get_rotation() -> float
- get_scale() -> Vector2
- get_skew() -> float
- interpolate_with(xform: Transform2D, weight: float) -> Transform2D
- inverse() -> Transform2D
- is_conformal() -> bool
- is_equal_approx(xform: Transform2D) -> bool
- is_finite() -> bool
- looking_at(target: Vector2 = Vector2(0, 0)) -> Transform2D
- orthonormalized() -> Transform2D
- rotated(angle: float) -> Transform2D
- rotated_local(angle: float) -> Transform2D
- scaled(scale: Vector2) -> Transform2D
- scaled_local(scale: Vector2) -> Transform2D
- translated(offset: Vector2) -> Transform2D
- translated_local(offset: Vector2) -> Transform2D

**Operators:**
- operator !=
- operator *
- operator *
- operator *
- operator *
- operator *
- operator *
- operator /
- operator /
- operator ==
- operator []
