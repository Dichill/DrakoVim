-- Keymaps are loaded on the VeryLazy event.
-- LazyVim defaults: https://www.lazyvim.org/keymaps
-- These additions bring VS Code muscle memory to DrakoVim.

local map = vim.keymap.set

-- Ctrl+P: quick-open files, exactly like VS Code's file palette.
map("n", "<C-p>", function()
  Snacks.picker.files()
end, { desc = "Find Files (VS Code style)" })

-- Ctrl+B: toggle the file explorer sidebar, like VS Code.
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer (VS Code style)" })

-- Ctrl+`: toggle the integrated terminal, like VS Code.
-- (LazyVim also binds Ctrl+/ for terminals in case your emulator
-- doesn't send Ctrl+backtick as a distinct key.)
map({ "n", "t" }, "<C-`>", function()
  Snacks.terminal()
end, { desc = "Toggle Terminal (VS Code style)" })

-- Ctrl+S: save from normal and insert mode.
map({ "n", "i", "x" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Shift+H / Shift+L: cycle through buffer tabs (LazyVim also has these;
-- kept here for discoverability).
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer Tab" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer Tab" })
