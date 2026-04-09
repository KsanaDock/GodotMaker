## PortableCompressedTexture2D <- Texture2D

**Props:**
- keep_compressed_buffer: bool = false
- resource_local_to_scene: bool = false
- size_override: Vector2 = Vector2(0, 0)

**Methods:**
- create_from_image(image: Image, compression_mode: int, normal_map: bool = false, lossy_quality: float = 0.8)
- get_compression_mode() -> int
- is_keeping_all_compressed_buffers() -> bool
- set_basisu_compressor_params(uastc_level: int, rdo_quality_loss: float)
- set_keep_all_compressed_buffers(keep: bool)
