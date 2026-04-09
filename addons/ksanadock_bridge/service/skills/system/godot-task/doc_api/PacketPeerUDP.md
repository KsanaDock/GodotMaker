## PacketPeerUDP <- PacketPeer

**Methods:**
- bind(port: int, bind_address: String = "*", recv_buf_size: int = 65536) -> int
- close()
- connect_to_host(host: String, port: int) -> int
- get_local_port() -> int
- get_packet_ip() -> String
- get_packet_port() -> int
- is_bound() -> bool
- is_socket_connected() -> bool
- join_multicast_group(multicast_address: String, interface_name: String) -> int
- leave_multicast_group(multicast_address: String, interface_name: String) -> int
- set_broadcast_enabled(enabled: bool)
- set_dest_address(host: String, port: int) -> int
- wait() -> int
