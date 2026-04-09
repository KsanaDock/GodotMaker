## PCKPacker <- RefCounted

**Methods:**
- add_file(target_path: String, source_path: String, encrypt: bool = false) -> int
- add_file_from_buffer(target_path: String, data: PackedByteArray, encrypt: bool = false) -> int
- add_file_removal(target_path: String) -> int
- flush(verbose: bool = false) -> int
- pck_start(pck_path: String, alignment: int = 32, key: String = "0000000000000000000000000000000000000000000000000000000000000000", encrypt_directory: bool = false) -> int
