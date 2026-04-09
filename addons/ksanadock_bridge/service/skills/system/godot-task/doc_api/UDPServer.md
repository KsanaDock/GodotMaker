## UDPServer <- RefCounted

**Props:**
- max_pending_connections: int = 16

**Methods:**
- get_local_port() -> int
- is_connection_available() -> bool
- is_listening() -> bool
- listen(port: int, bind_address: String = "*") -> int
- poll() -> int
- stop()
- take_connection() -> PacketPeerUDP
