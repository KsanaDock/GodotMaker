## GDExtensionManager <- Object

**Methods:**
- get_extension(path: String) -> GDExtension
- get_loaded_extensions() -> PackedStringArray
- is_extension_loaded(path: String) -> bool
- load_extension(path: String) -> int
- load_extension_from_function(path: String, init_func: const GDExtensionInitializationFunction*) -> int
- reload_extension(path: String) -> int
- unload_extension(path: String) -> int

**Signals:**
- extension_loaded(extension: GDExtension)
- extension_unloading(extension: GDExtension)
- extensions_reloaded
