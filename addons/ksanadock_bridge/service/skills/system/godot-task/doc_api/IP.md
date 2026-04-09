## IP <- Object

**Methods:**
- clear_cache(hostname: String = "")
- erase_resolve_item(id: int)
- get_local_addresses() -> PackedStringArray
- get_local_interfaces() -> Dictionary[]
- get_resolve_item_address(id: int) -> String
- get_resolve_item_addresses(id: int) -> Array
- get_resolve_item_status(id: int) -> int
- resolve_hostname(host: String, ip_type: int = 3) -> String
- resolve_hostname_addresses(host: String, ip_type: int = 3) -> PackedStringArray
- resolve_hostname_queue_item(host: String, ip_type: int = 3) -> int
