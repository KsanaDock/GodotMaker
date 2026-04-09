## AESContext <- RefCounted

**Methods:**
- finish()
- get_iv_state() -> PackedByteArray
- start(mode: int, key: PackedByteArray, iv: PackedByteArray = PackedByteArray()) -> int
- update(src: PackedByteArray) -> PackedByteArray
