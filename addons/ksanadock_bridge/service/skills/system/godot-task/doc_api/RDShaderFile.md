## RDShaderFile <- Resource

**Props:**
- base_error: String = ""

**Methods:**
- get_spirv(version: StringName = &"") -> RDShaderSPIRV
- get_version_list() -> StringName[]
- set_bytecode(bytecode: RDShaderSPIRV, version: StringName = &"")
