## TextServerManager <- Object

**Methods:**
- add_interface(interface: TextServer)
- find_interface(name: String) -> TextServer
- get_interface(idx: int) -> TextServer
- get_interface_count() -> int
- get_interfaces() -> Dictionary[]
- get_primary_interface() -> TextServer
- remove_interface(interface: TextServer)
- set_primary_interface(index: TextServer)

**Signals:**
- interface_added(interface_name: StringName)
- interface_removed(interface_name: StringName)
