## AnimationTree <- AnimationMixer

**Props:**
- advance_expression_base_node: NodePath = NodePath(".")
- anim_player: NodePath = NodePath("")
- callback_mode_discrete: int = 2
- deterministic: bool = true
- tree_root: AnimationRootNode

**Methods:**
- get_process_callback() -> int
- set_process_callback(mode: int)

**Signals:**
- animation_player_changed
