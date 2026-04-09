## HTTPClient <- RefCounted

**Props:**
- blocking_mode_enabled: bool = false
- connection: StreamPeer
- read_chunk_size: int = 65536

**Methods:**
- close()
- connect_to_host(host: String, port: int = -1, tls_options: TLSOptions = null) -> int
- get_response_body_length() -> int
- get_response_code() -> int
- get_response_headers() -> PackedStringArray
- get_response_headers_as_dictionary() -> Dictionary
- get_status() -> int
- has_response() -> bool
- is_response_chunked() -> bool
- poll() -> int
- query_string_from_dict(fields: Dictionary) -> String
- read_response_body_chunk() -> PackedByteArray
- request(method: int, url: String, headers: PackedStringArray, body: String = "") -> int
- request_raw(method: int, url: String, headers: PackedStringArray, body: PackedByteArray) -> int
- set_http_proxy(host: String, port: int)
- set_https_proxy(host: String, port: int)
