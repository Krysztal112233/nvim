# selective-fold.nvim

Folds Markdown fences marked with standalone `fold` (case-insensitive). Requires a Markdown Tree-sitter parser.

- `:MarkdownFold [on|off|toggle]`: current window; no argument toggles.
- Load at startup (`lazy = false`), before `site` in runtimepath; no `setup()` needed.
- Language rules: `lua/selective_fold/rules/`; queries: `queries/`. Flat folds only.

Test from this directory:

```sh
nvim --headless -u NONE -i NONE -n -l tests/run.lua
```
