-- Bootstrap lazy.nvim (plugin manager) if it isn't installed yet.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim core plus its full default plugin suite.
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- DrakoVim customizations live in lua/plugins/.
    { import = "plugins" },
  },
  defaults = {
    -- Custom plugins load during startup for a predictable experience.
    lazy = false,
    -- Always use the latest git commit rather than pinned releases.
    version = false,
  },
  install = { colorscheme = { "vscode", "habamax" } },
  checker = {
    -- Periodically check for plugin updates, but don't nag with popups.
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      -- Disable rarely used built-in plugins for faster startup.
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
