## PacketPeer <- RefCounted

**Props:**
- encode_buffer_max_size: int = 8388608

**Methods:**
- get_available_packet_count() -> int
- get_packet() -> PackedByteArray
- get_packet_error() -> int
- get_var(allow_objects: bool = false) -> Variant
- put_packet(buffer: PackedByteArray) -> int
- put_var(var: Variant, full_objects: bool = false) -> int
