## JavaScriptBridge <- Object

**Methods:**
- create_callback(callable: Callable) -> JavaScriptObject
- create_object(object: String) -> Variant
- download_buffer(buffer: PackedByteArray, name: String, mime: String = "application/octet-stream")
- eval(code: String, use_global_execution_context: bool = false) -> Variant
- force_fs_sync()
- get_interface(interface: String) -> JavaScriptObject
- is_js_buffer(javascript_object: JavaScriptObject) -> bool
- js_buffer_to_packed_byte_array(javascript_buffer: JavaScriptObject) -> PackedByteArray
- pwa_needs_update() -> bool
- pwa_update() -> int

**Signals:**
- pwa_update_available
