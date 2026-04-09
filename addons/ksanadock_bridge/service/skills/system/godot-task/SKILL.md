---
name: godot-task
description: |
  Execute a single Godot development task — generate scenes and/or scripts, verify visually.
context: fork
---

# Godot Task Executor

All files below are in `${SKILL_DIR}/`. Load progressively — read each file when its phase begins, not upfront.

| File | Purpose | When to read |
|------|---------|--------------|
| `quirks.md` | Known Godot gotchas and workarounds | Before writing any code |
| `gdscript.md` | GDScript syntax reference | Before writing any code |
| `scene-generation.md` | Building `.tscn` files via headless GDScript builders | Targets include `.tscn` |
| `script-generation.md` | Writing runtime `.gd` scripts for node behavior | Targets include `.gd` |
| `coordination.md` | Ordering scene + script generation | Targets include both `.tscn` and `.gd` |
| `doc_api/_common.md` | Index of ~128 common Godot classes (one-line each) | Need API ref; scan to find class names |
| `doc_api/_other.md` | Index of ~732 remaining Godot classes | Need API ref; class isn't in `_common.md` |
| `doc_api/{ClassName}.md` | Full API reference for a single Godot class | **DO NOT read full file for large classes.** Use `grep_search` to find method/prop signatures first. |

Execute a single development task from PLAN.md:

$ARGUMENTS

## Workflow

1. **Analyze the task** — read the task's **Targets** to determine what to generate:
   - `scenes/*.tscn` targets → generate scene builder(s)
   - `scripts/*.gd` targets → generate runtime script(s)
   - Both → generate scenes FIRST, then scripts (scenes create nodes that scripts attach to)
2. **Import assets** — run `timeout 60 godot --headless --import` to generate `.import` files for any new textures, GLBs, or resources. Without this, `load()` fails with "No loader found" errors. Re-run after modifying existing assets.
3. **Generate scene(s)** — write GDScript scene builder, compile to produce `.tscn`
4. **Generate script(s)** — write `.gd` files to `scripts/`
5. **Pre-validate scripts** — catch compilation errors early before full project validation. For each newly written or modified `.gd` file, run `timeout 30 godot --headless --quit 2>&1` and filter the output for errors mentioning that file's path.
6. **Validate project** — run `timeout 60 godot --headless --quit 2>&1` to parse-check all project scripts. **This is the primary quality gate.**
7. **Fix errors** — if Godot reports errors, read output, fix files, re-run. Repeat until clean.
8. **Verify** — analyze the validation logs and any generated files to ensure:
   - **Task goal:** does the code/scene structure match the requirements?
   - **Logic & quality:** look for obvious bugs or anti-patterns in the generated GDScript.
   If any check fails, identify the issue, fix scene/script, and repeat from step 3.
9. **Store evidence** — record the final file paths and key implementation details before reporting completion.

## Iteration Tracking

Steps 3-9 form an **implement → validate → verify** loop.

There is no fixed iteration limit — use judgment:
- If there is progress — even in small, iterative steps — keep going. Screenshots and file updates are cheap.
- If you recognize a **fundamental limitation** (wrong architecture, missing engine feature, broken assumption), stop early — even after 2-5 iterations. More loops won't help.
- The signal to stop is **"I'm making the same kind of fix repeatedly without convergence"**.

Always end your response with:
- **Modified files:** List of all files created or updated.
- **Implementation details:** Brief summary of the key logic implemented.

The caller (godogen orchestrator) will decide whether to adjust the task, re-scaffold, or accept the current state.

## Commands

```bash
# Import new/modified assets (MUST run before scene builders):
timeout 60 godot --headless --import

# Compile a scene builder (produces .tscn):
timeout 60 godot --headless --script <path_to_gd_builder>

# Validate all project scripts (parse check):
timeout 60 godot --headless --quit 2>&1
```

**Structured error recovery:** When a compilation error is caught:
1. Parse the error — extract the file path, line number, and error type from Godot's output
2. Look up the class — if the error mentions an unknown method or property, read `doc_api/{ClassName}.md` for the class involved
3. Check quirks — cross-reference against `quirks.md` for known patterns (`:=` with `instantiate()`, polymorphic math functions, Camera2D `current`, etc.)
4. Fix and re-validate — edit the specific file, then re-run the pre-validation step on that file only before proceeding

**Error handling:** Parse Godot's stderr/stdout for error lines. Common issues:
- `Parser Error` — syntax error in GDScript, fix the line indicated
- `Invalid call` / `method not found` — wrong node type or API usage, look up the class in `doc_api`
- `Cannot infer type` — `:=` used with `instantiate()` or polymorphic math functions, see type inference rules
- Script hangs — missing `quit()` call in scene builder; kill the process and add `quit()`

## Project Memory

Read `MEMORY.md` before starting work — it contains discoveries from previous tasks (workarounds, Godot quirks, asset details, architectural decisions). After completing your task, write back anything useful you learned: what worked, what failed, technical specifics others will need.
