## JSONRPC <- Object

**Methods:**
- make_notification(method: String, params: Variant) -> Dictionary
- make_request(method: String, params: Variant, id: Variant) -> Dictionary
- make_response(result: Variant, id: Variant) -> Dictionary
- make_response_error(code: int, message: String, id: Variant = null) -> Dictionary
- process_action(action: Variant, recurse: bool = false) -> Variant
- process_string(action: String) -> String
- set_method(name: String, callback: Callable)
