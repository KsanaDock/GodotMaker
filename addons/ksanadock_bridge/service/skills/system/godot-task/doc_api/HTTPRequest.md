## HTTPRequest <- Node

**Props:**
- accept_gzip: bool = true
- body_size_limit: int = -1
- download_chunk_size: int = 65536
- download_file: String = ""
- max_redirects: int = 8
- timeout: float = 0.0
- use_threads: bool = false

**Methods:**
- cancel_request()
- get_body_size() -> int
- get_downloaded_bytes() -> int
- get_http_client_status() -> int
- request(url: String, custom_headers: PackedStringArray = PackedStringArray(), method: int = 0, request_data: String = "") -> int
- request_raw(url: String, custom_headers: PackedStringArray = PackedStringArray(), method: int = 0, request_data_raw: PackedByteArray = PackedByteArray()) -> int
- set_http_proxy(host: String, port: int)
- set_https_proxy(host: String, port: int)
- set_tls_options(client_options: TLSOptions)

**Signals:**
- request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray)
