## Transform3D

**Props:**
- basis: Basis = Basis(1, 0, 0, 0, 1, 0, 0, 0, 1)
- origin: Vector3 = Vector3(0, 0, 0)

**Ctors:**
- Transform3D()
- Transform3D(from: Transform3D)
- Transform3D(basis: Basis, origin: Vector3)
- Transform3D(from: Projection)
- Transform3D(x_axis: Vector3, y_axis: Vector3, z_axis: Vector3, origin: Vector3)

**Methods:**
- affine_inverse() -> Transform3D
- interpolate_with(xform: Transform3D, weight: float) -> Transform3D
- inverse() -> Transform3D
- is_equal_approx(xform: Transform3D) -> bool
- is_finite() -> bool
- looking_at(target: Vector3, up: Vector3 = Vector3(0, 1, 0), use_model_front: bool = false) -> Transform3D
- orthonormalized() -> Transform3D
- rotated(axis: Vector3, angle: float) -> Transform3D
- rotated_local(axis: Vector3, angle: float) -> Transform3D
- scaled(scale: Vector3) -> Transform3D
- scaled_local(scale: Vector3) -> Transform3D
- translated(offset: Vector3) -> Transform3D
- translated_local(offset: Vector3) -> Transform3D

**Operators:**
- operator !=
- operator *
- operator *
- operator *
- operator *
- operator *
- operator *
- operator *
- operator /
- operator /
- operator ==
