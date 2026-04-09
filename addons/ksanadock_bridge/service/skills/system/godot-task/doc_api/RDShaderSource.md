## RDShaderSource <- RefCounted

**Props:**
- language: int = 0
- source_any_hit: String = ""
- source_closest_hit: String = ""
- source_compute: String = ""
- source_fragment: String = ""
- source_intersection: String = ""
- source_miss: String = ""
- source_raygen: String = ""
- source_tesselation_control: String = ""
- source_tesselation_evaluation: String = ""
- source_vertex: String = ""

**Methods:**
- get_stage_source(stage: int) -> String
- set_stage_source(stage: int, source: String)
