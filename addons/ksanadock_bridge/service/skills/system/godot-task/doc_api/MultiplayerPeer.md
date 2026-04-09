## MultiplayerPeer <- PacketPeer

**Props:**
- refuse_new_connections: bool = false
- transfer_channel: int = 0
- transfer_mode: int = 2

**Methods:**
- close()
- disconnect_peer(peer: int, force: bool = false)
- generate_unique_id() -> int
- get_connection_status() -> int
- get_packet_channel() -> int
- get_packet_mode() -> int
- get_packet_peer() -> int
- get_unique_id() -> int
- is_server_relay_supported() -> bool
- poll()
- set_target_peer(id: int)

**Signals:**
- peer_connected(id: int)
- peer_disconnected(id: int)
