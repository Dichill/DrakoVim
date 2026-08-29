# DrakoVim

A [LazyVim](https://www.lazyvim.org/)-based Neovim setup styled after VS Code —
Dark+ theme, explorer docked on the right, editor tabs on top, integrated
terminal on the bottom. Launch it with `dvim`.

## Usage

```bash
dvim            # open DrakoVim in the current directory
dvim file.py    # open a file
```

The `dvim` alias (in `~/.zshrc`) runs `NVIM_APPNAME=dvim nvim`, so DrakoVim is
fully isolated from any other Neovim setup on your machine. This repo is
symlinked to `~/.config/dvim`; its plugin data lives in `~/.local/share/dvim`.

## Layout (matches VS Code)

| VS Code                 | DrakoVim                                           |
| ----------------------- | -------------------------------------------------- |
| Theme                   | VS Code Dark+ via `Mofiqul/vscode.nvim`            |
| Explorer (right side)   | neo-tree, docked right, dotfiles visible           |
| Editor tabs             | bufferline.nvim                                    |
| Integrated terminal     | snacks terminal (bottom panel)                     |
| Status bar              | lualine with the VS Code palette                   |
| Command palette         | snacks picker                                      |
| Format on save          | conform.nvim (enabled by default)                  |

## Key bindings (VS Code muscle memory)

| Key            | Action                                     |
| -------------- | ------------------------------------------ |
| `Ctrl+P`       | Quick-open files                           |
| `Ctrl+B`       | Toggle the file explorer                   |
| `` Ctrl+` ``   | Toggle the integrated terminal (also `Ctrl+/`) |
| `Ctrl+S`       | Save                                       |
| `Shift+H/L`    | Previous / next editor tab                 |
| `Space`        | Leader — pause to see every command (which-key) |
| `Space Space`  | Find files                                 |
| `Space /`      | Search across the project (like `Ctrl+Shift+F`) |
| `Space g g`    | Lazygit (if installed)                     |
| `Space e`      | Focus/toggle explorer                      |

All standard LazyVim keymaps apply: <https://www.lazyvim.org/keymaps>

## Languages preconfigured

Python (basedpyright + ruff), TypeScript/JavaScript (vtsls), JSON, Markdown,
Lua — servers and formatters are preinstalled via Mason. Add more with
`:LazyExtras`.

## Structure

```
init.lua                    entry point
lua/config/lazy.lua         lazy.nvim bootstrap + plugin spec
lua/config/options.lua      editor options (absolute numbers, 4-space indent…)
lua/config/keymaps.lua      VS Code-style key bindings
lua/config/autocmds.lua     terminal polish, future autocmds
lua/plugins/colorscheme.lua VS Code Dark+ theme
lua/plugins/ui.lua          explorer/right, tabs, statusline, dashboard
lazyvim.json                enabled LazyVim extras
```

## Terminal theming (Warp + Starship)

The DrakoVim look extends to the terminal. Configs live in `extras/`:

- `extras/warp/DrakoVim.yaml` — Warp theme: VS Code Dark+ ANSI palette with
  the DrakoVim red accent. Install: copy to `~/.warp/themes/` and select
  "DrakoVim" in Warp's theme picker (or set `theme = "DrakoVim"` in
  `~/.warp/settings.toml`).
- `extras/starship/starship.toml` — blocky [Starship](https://starship.rs)
  prompt in the DrakoVim palette: red path block, git/conda/venv/duration
  blocks on the right. Install: copy to `~/.config/starship.toml` and add
  `eval "$(starship init zsh)"` to your `~/.zshrc`.

## Maintenance

- `:Lazy sync` — update plugins
- `:LazyExtras` — enable more language/tooling extras
- `:Mason` — manage language servers and formatters
- `:LazyHealth` — check that everything is healthy

The previous `~/.config/dvim` contents were backed up to
`~/.config/dvim.bak-20260827`.
