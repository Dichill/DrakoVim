# DrakoVim Cheatsheet

`Space` is the leader key. Press it and pause — which-key shows every option.
Press `?` inside neo-tree or any picker for its local help.

## The 90% workflow

| Key | Action |
| --- | --- |
| `Ctrl+P` / `Space Space` | Fuzzy-open a file |
| `Space /` | Grep across the project (Ctrl+Shift+F) |
| `Shift+H` / `Shift+L` | Previous / next tab |
| `Ctrl+H/J/K/L` | Jump between panes (editor ↔ explorer ↔ terminal) |
| `Ctrl+B` / `Space e` | Toggle the explorer |
| `` Ctrl+` `` / `Ctrl+/` | Toggle the terminal |
| `Ctrl+S` | Save |
| `Space b d` | Close tab · `Space b p` pin · `Space b P` close non-pinned |

## Code intelligence (LSP)

| Key | Action |
| --- | --- |
| `g d` | Go to definition |
| `g r` | Find references |
| `g I` | Go to implementation |
| `K` | Hover docs (press again to scroll into it) |
| `Space c r` | Rename symbol everywhere |
| `Space c a` | Code action (auto-import, quick fix) |
| `Space c f` | Format file (also runs on save) |
| `] d` / `[ d` | Next / previous diagnostic |
| `Space x x` | All diagnostics in a list |
| `Space s s` | Jump to symbol in file (Cmd+Shift+O) |

## Moving without the mouse

| Key | Action |
| --- | --- |
| `s` + 2 chars | Flash jump — type 2 characters, labels appear, press one to teleport |
| `Ctrl+O` / `Ctrl+I` | Jump back / forward through locations (like browser history) |
| `gg` / `G` | Top / bottom of file |
| `{` / `}` | Previous / next blank line (paragraph hops) |
| `%` | Matching bracket |
| `0` / `^` / `$` | Line start / first char / line end |
| `f x` / `t x` | Jump onto / before character `x` in the line (`;` repeats) |
| `Ctrl+D` / `Ctrl+U` | Half-page down / up (keeps cursor centered) |
| `*` | Search for the word under cursor (`n` next hit) |

## Editing at speed

| Key | Action |
| --- | --- |
| `c i w` | Change inside word (cursor anywhere in it) |
| `c i "` / `c i (` / `c i {` | Change inside quotes / parens / braces |
| `d a (` | Delete parens *and* contents |
| `v i f` (LazyVim) | Select inside function via treesitter objects: `a f` around function, `i c` inside class |
| `.` | Repeat last change — the biggest speed multiplier in vim |
| `u` / `Ctrl+R` | Undo / redo |
| `> >` / `< <` | Indent / outdent line (visual mode: `>` once) |
| `Alt+J` / `Alt+K` | Move current line/selection down / up |
| `g c c` | Toggle comment line (`g c` + motion, e.g. `g c a p` for a paragraph) |
| `y y` `p` | Copy line, paste below |
| `Ctrl+A` / `Ctrl+X` | Increment / decrement number under cursor |
| `g s a` + motion + char | Add surrounding (e.g. `g s a i w "` wraps word in quotes) |
| `Space s r` | Search & replace across files (grug-far) |

## Multi-line editing (VS Code multi-cursor equivalent)

1. `Ctrl+V` — visual block mode
2. Move down with `j` to extend over lines
3. `I` (insert at start) or `A` (append at end), type once, `Esc` — applies to all lines

Or: `*` on a word, then `c g n` to change it and `.` to repeat on the next hits —
a targeted "select next occurrence" workflow.

## Git

| Key | Action |
| --- | --- |
| `Space g g` | Lazygit — full git UI (stage, commit, push, branch) |
| `] h` / `[ h` | Next / previous changed hunk |
| `Space g h s` | Stage hunk · `Space g h r` reset hunk |
| `Space g b` | Blame current line |

## AI (after `:Copilot auth`)

| Key | Action |
| --- | --- |
| `Tab` (insert mode) | Accept inline ghost-text suggestion |
| `Space a a` | Ask avante about your code |
| `Space a e` | AI-edit the visual selection (review diff, accept/reject) |
| `Space a t` | Toggle the AI sidebar |

## Explorer (neo-tree, while focused)

| Key | Action |
| --- | --- |
| `a` | New file (end with `/` for a folder) |
| `r` | Rename · `d` delete · `c` copy · `m` move |
| `H` | Toggle hidden files |
| `Enter` | Open file · `P` preview without leaving the tree |
| `?` | All explorer keys |

## Escape hatches

- `Esc Esc` in the terminal → normal mode
- `Space u n` — dismiss notifications
- `:Lazy` plugins · `:Mason` tools · `:LazyHealth` diagnose
- Stuck in some mode? Mash `Esc`. Quit everything: `:qa`
