## ScriptCreateDialog <- ConfirmationDialog

**Props:**
- dialog_hide_on_ok: bool = false
- ok_button_text: String = "Create"
- title: String = "Attach Node Script"

**Methods:**
- config(inherits: String, path: String, built_in_enabled: bool = true, load_enabled: bool = true)

**Signals:**
- script_created(script: Script)
