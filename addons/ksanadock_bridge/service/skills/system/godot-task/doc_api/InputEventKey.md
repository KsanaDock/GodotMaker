## InputEventKey <- InputEventWithModifiers

**Props:**
- echo: bool = false
- key_label: int = 0
- keycode: int = 0
- location: int = 0
- physical_keycode: int = 0
- pressed: bool = false
- unicode: int = 0

**Methods:**
- as_text_key_label() -> String
- as_text_keycode() -> String
- as_text_location() -> String
- as_text_physical_keycode() -> String
- get_key_label_with_modifiers() -> int
- get_keycode_with_modifiers() -> int
- get_physical_keycode_with_modifiers() -> int
