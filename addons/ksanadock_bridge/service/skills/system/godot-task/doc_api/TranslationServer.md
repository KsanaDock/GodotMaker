## TranslationServer <- Object

**Props:**
- pseudolocalization_enabled: bool = false

**Methods:**
- add_translation(translation: Translation)
- clear()
- compare_locales(locale_a: String, locale_b: String) -> int
- find_translations(locale: String, exact: bool) -> Translation[]
- format_number(number: String, locale: String) -> String
- get_all_countries() -> PackedStringArray
- get_all_languages() -> PackedStringArray
- get_all_scripts() -> PackedStringArray
- get_country_name(country: String) -> String
- get_language_name(language: String) -> String
- get_loaded_locales() -> PackedStringArray
- get_locale() -> String
- get_locale_name(locale: String) -> String
- get_or_add_domain(domain: StringName) -> TranslationDomain
- get_percent_sign(locale: String) -> String
- get_plural_rules(locale: String) -> String
- get_script_name(script: String) -> String
- get_tool_locale() -> String
- get_translation_object(locale: String) -> Translation
- get_translations() -> Translation[]
- has_domain(domain: StringName) -> bool
- has_translation(translation: Translation) -> bool
- has_translation_for_locale(locale: String, exact: bool) -> bool
- parse_number(number: String, locale: String) -> String
- pseudolocalize(message: StringName) -> StringName
- reload_pseudolocalization()
- remove_domain(domain: StringName)
- remove_translation(translation: Translation)
- set_locale(locale: String)
- standardize_locale(locale: String, add_defaults: bool = false) -> String
- translate(message: StringName, context: StringName = &"") -> StringName
- translate_plural(message: StringName, plural_message: StringName, n: int, context: StringName = &"") -> StringName
