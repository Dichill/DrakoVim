-- avante.nvim: Cursor-style AI sidebar — chat about code, plan changes,
-- and apply AI-generated edits with inline diffs.
-- Uses GitHub Copilot as the model provider (no API key needed; run
-- `:Copilot auth` once to sign in with GitHub).
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    -- Downloads the prebuilt avante library (falls back to cargo build).
    build = "make",
    opts = {
      provider = "copilot",
      behaviour = {
        -- Inline ghost-text suggestions are handled by copilot.lua
        -- (LazyVim ai.copilot extra); avante's own suggestion engine
        -- stays off to avoid double-suggesting.
        auto_suggestions = false,
        auto_set_keymaps = true,
      },
      windows = {
        -- Sidebar on the LEFT, since the file explorer owns the right.
        position = "left",
        width = 35,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
    },
    config = function(_, opts)
      -- Avante's copilot provider needs the GitHub OAuth token that
      -- `:Copilot auth` creates. Guard the setup so a fresh machine gets
      -- a friendly hint instead of a startup stacktrace.
      local has_token = vim.fn.filereadable(vim.fn.expand("~/.config/github-copilot/apps.json")) == 1
        or vim.fn.filereadable(vim.fn.expand("~/.config/github-copilot/hosts.json")) == 1
      if not has_token then
        vim.notify(
          "Avante is installed but Copilot isn't signed in yet.\nRun :Copilot auth, then restart dvim.",
          vim.log.levels.WARN,
          { title = "DrakoVim" }
        )
        return
      end
      require("avante").setup(opts)
    end,
  },

  -- Render markdown nicely inside avante's chat sidebar.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = { "markdown", "Avante" },
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or { "markdown" }, { "Avante" })
    end,
  },
}
