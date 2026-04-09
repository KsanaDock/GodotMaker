## EditorResourcePreview <- Node

**Methods:**
- add_preview_generator(generator: EditorResourcePreviewGenerator)
- check_for_invalidation(path: String)
- queue_edited_resource_preview(resource: Resource, receiver: Object, receiver_func: StringName, userdata: Variant)
- queue_resource_preview(path: String, receiver: Object, receiver_func: StringName, userdata: Variant)
- remove_preview_generator(generator: EditorResourcePreviewGenerator)

**Signals:**
- preview_invalidated(path: String)
