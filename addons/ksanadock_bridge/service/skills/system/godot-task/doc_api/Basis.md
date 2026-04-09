## Basis

**Props:**
- x: Vector3 = Vector3(1, 0, 0)
- y: Vector3 = Vector3(0, 1, 0)
- z: Vector3 = Vector3(0, 0, 1)

**Ctors:**
- Basis()
- Basis(from: Basis)
- Basis(axis: Vector3, angle: float)
- Basis(from: Quaternion)
- Basis(x_axis: Vector3, y_axis: Vector3, z_axis: Vector3)

**Methods:**
- determinant() -> float
- from_euler(euler: Vector3, order: int = 2) -> Basis
- from_scale(scale: Vector3) -> Basis
- get_euler(order: int = 2) -> Vector3
- get_rotation_quaternion() -> Quaternion
- get_scale() -> Vector3
- inverse() -> Basis
- is_conformal() -> bool
- is_equal_approx(b: Basis) -> bool
- is_finite() -> bool
- is_orthonormal() -> bool
- looking_at(target: Vector3, up: Vector3 = Vector3(0, 1, 0), use_model_front: bool = false) -> Basis
- orthonormalized() -> Basis
- rotated(axis: Vector3, angle: float) -> Basis
- scaled(scale: Vector3) -> Basis
- scaled_local(scale: Vector3) -> Basis
- slerp(to: Basis, weight: float) -> Basis
- tdotx(with: Vector3) -> float
- tdoty(with: Vector3) -> float
- tdotz(with: Vector3) -> float
- transposed() -> Basis

**Operators:**
- operator !=
- operator *
- operator *
- operator *
- operator *
- operator /
- operator /
- operator ==
- operator []
