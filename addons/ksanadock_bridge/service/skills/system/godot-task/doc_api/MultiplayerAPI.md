## MultiplayerAPI <- RefCounted

**Props:**
- multiplayer_peer: MultiplayerPeer

**Methods:**
- create_default_interface() -> MultiplayerAPI
- get_default_interface() -> StringName
- get_peers() -> PackedInt32Array
- get_remote_sender_id() -> int
- get_unique_id() -> int
- has_multiplayer_peer() -> bool
- is_server() -> bool
- object_configuration_add(object: Object, configuration: Variant) -> int
- object_configuration_remove(object: Object, configuration: Variant) -> int
- poll() -> int
- rpc(peer: int, object: Object, method: StringName, arguments: Array = []) -> int
- set_default_interface(interface_name: StringName)

**Signals:**
- connected_to_server
- connection_failed
- peer_connected(id: int)
- peer_disconnected(id: int)
- server_disconnected
