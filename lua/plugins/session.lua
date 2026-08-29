-- Auto-restore the last session for this project when you open `dvim`
-- with no file. Sessions already save on quit (persistence.nvim).
return {
  {
    "folke/persistence.nvim",
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("drakovim_restore_session", { clear = true }),
        nested = true,
        callback = function()
          -- `dvim file.py` should open just that file, not the old session.
          local argc = vim.fn.argc(-1)
          local only_dir = argc == 1 and vim.fn.isdirectory(tostring(vim.fn.argv(0))) == 1
          if argc > 0 and not only_dir then
            return
          end

          -- Wait a tick so the dashboard and plugins finish starting,
          -- then load this directory's session if one exists.
          vim.schedule(function()
            require("persistence").load()
          end)
        end,
      })
    end,
  },
}
