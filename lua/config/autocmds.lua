-- Autocmds are loaded on the VeryLazy event.
-- LazyVim defaults: https://www.lazyvim.org/configuration/general#auto-commands

-- Return to the last cursor position when reopening a file (VS Code behavior).
-- (LazyVim already provides this; this file is the home for future autocmds.)

-- Highlight trailing whitespace only in code buffers, never in terminals.
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("drakovim_term", { clear = true }),
  callback = function()
    -- Clean, VS Code-like terminal: no line numbers or sign column.
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})
