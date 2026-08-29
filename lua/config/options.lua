-- Options are loaded before lazy.nvim startup.
-- LazyVim defaults: https://www.lazyvim.org/configuration/general

local opt = vim.opt

-- VS Code uses absolute line numbers; disable LazyVim's relative default.
opt.number = true
opt.relativenumber = false

-- Long lines scroll horizontally instead of wrapping, like VS Code.
opt.wrap = false

-- Keep context visible while scrolling.
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 4-space indentation to match typical VS Code defaults.
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Subtle vertical guide-friendly rendering.
opt.fillchars:append({ eob = " " })

-- Faster diagnostics and gitsigns updates.
opt.updatetime = 200

-- Global LazyVim behavior toggles.
vim.g.autoformat = true -- format on save (like VS Code's formatOnSave)
vim.g.lazyvim_picker = "snacks" -- modern fuzzy picker (Ctrl+P workflow)
vim.g.lazyvim_python_lsp = "basedpyright" -- modern, faster pyright fork
