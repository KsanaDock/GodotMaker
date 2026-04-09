## StreamPeerTLS <- StreamPeer

**Methods:**
- accept_stream(stream: StreamPeer, server_options: TLSOptions) -> int
- connect_to_stream(stream: StreamPeer, common_name: String, client_options: TLSOptions = null) -> int
- disconnect_from_stream()
- get_status() -> int
- get_stream() -> StreamPeer
- poll()
