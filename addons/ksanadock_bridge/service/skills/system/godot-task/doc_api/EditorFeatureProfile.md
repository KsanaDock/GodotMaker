## EditorFeatureProfile <- RefCounted

**Methods:**
- get_feature_name(feature: int) -> String
- is_class_disabled(class_name: StringName) -> bool
- is_class_editor_disabled(class_name: StringName) -> bool
- is_class_property_disabled(class_name: StringName, property: StringName) -> bool
- is_feature_disabled(feature: int) -> bool
- load_from_file(path: String) -> int
- save_to_file(path: String) -> int
- set_disable_class(class_name: StringName, disable: bool)
- set_disable_class_editor(class_name: StringName, disable: bool)
- set_disable_class_property(class_name: StringName, property: StringName, disable: bool)
- set_disable_feature(feature: int, disable: bool)
