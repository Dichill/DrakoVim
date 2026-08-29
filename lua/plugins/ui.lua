-- UI layout tuned to mirror VS Code: explorer docked on the right,
-- editor tabs on top, VS Code-colored statusline on the bottom.
return {
  -- File explorer: docked on the RIGHT and styled like VS Code's Explorer.
  -- NOTE: file-type icons require a Nerd Font in your terminal
  -- (Hack Nerd Font is installed and configured for Cursor/VS Code terminals).
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- Thin popup borders, closer to VS Code's flat UI.
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "right",
        width = 36,
      },
      filesystem = {
        -- Show dotfiles/gitignored files dimmed, like VS Code's explorer.
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = { ".DS_Store" },
        },
        -- Keep the tree in sync with the file you're editing.
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        -- Compact indentation with chevrons only (VS Code hides tree lines).
        indent = {
          indent_size = 2,
          padding = 0,
          with_markers = false,
          with_expanders = true,
          -- Unicode escapes are used for all Nerd Font glyphs so the
          -- characters survive any copy/encoding step.
          expander_collapsed = "\u{f105}", -- chevron right
          expander_expanded = "\u{f107}", -- chevron down
          expander_highlight = "NeoTreeExpander",
        },
        -- Folder icons matching VS Code's filled folder glyphs.
        icon = {
          folder_closed = "\u{f07b}", -- filled folder
          folder_open = "\u{f07c}", -- filled open folder
          folder_empty = "\u{f114}", -- outline folder
          folder_empty_open = "\u{f115}", -- outline open folder
          -- Fallback icon for files with no specific devicon.
          default = "\u{f016}", -- generic file outline
        },
        -- Dot next to unsaved buffers, like VS Code's modified indicator.
        modified = { symbol = "●" },
        name = {
          trailing_slash = false,
          -- Color file names by git state (green added, yellow modified…).
          use_git_status_colors = true,
        },
        -- Letter badges on the right edge, exactly like VS Code (M/A/D/U…).
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "U",
            ignored = "",
            unstaged = "",
            staged = "S",
            conflict = "!",
          },
          align = "right",
        },
      },
    },
  },

  -- Editor tabs across the top.
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        separator_style = "thin",
        -- Reserve space when the explorer is open on the right.
        offsets = {
          {
            filetype = "neo-tree",
            text = "EXPLORER",
            text_align = "center",
            highlight = "PanelHeading",
          },
        },
      },
    },
  },

  -- Statusline: VS Code palette with the DrakoVim red accent in normal mode.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Start from the vscode lualine theme, then repaint normal mode
      -- with the soft red accent. Other modes keep their colors so the
      -- statusline still signals insert/visual/replace at a glance.
      local theme = vim.deepcopy(require("lualine.themes.vscode"))
      theme.normal.a.bg = "#D16969"
      theme.normal.a.fg = "#1E1E1E"
      theme.normal.b.fg = "#E38A8A"

      opts.options = opts.options or {}
      opts.options.theme = theme
      -- Single statusline across the whole bottom, like VS Code.
      opts.options.globalstatus = true
    end,
  },

  -- Snacks quality-of-life: indent guides, dashboard, smooth scrolling.
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- A different motto greets you on every launch.
        sections = {
          { section = "header" },
          function()
            local mottos = {
              "You look handsome today Dichill",
              "Lock in and Lock Hard",
              "If theres a will, theres a way",
              "Be Brave, Be Bold, Be You - From your Azizam",
              "Defeat the Impossible",
              "Seek the questions, not the answers",
            }
            math.randomseed(vim.uv.hrtime())
            return {
              text = { { mottos[math.random(#mottos)], hl = "DrakoVimMotto" } },
              align = "center",
              padding = 1,
            }
          end,
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = table.concat({
            "██████╗ ██████╗  █████╗ ██╗  ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██╔═══██╗██║   ██║██║████╗ ████║",
            "██║  ██║██████╔╝███████║█████╔╝ ██║   ██║██║   ██║██║██╔████╔██║",
            "██║  ██║██╔══██╗██╔══██║██╔═██╗ ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██████╔╝██║  ██║██║  ██║██║  ██╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          }, "\n"),
        },
      },
      -- Thin indent guides like VS Code's.
      indent = {
        indent = { char = "│" },
        scope = { enabled = true },
      },
      scroll = { enabled = true },
      styles = {
        -- Terminal panel: transparent like the editor (snacks maps it to
        -- NormalFloat by default, which stays solid for picker readability).
        terminal = {
          wo = {
            winhighlight = "Normal:Normal,NormalNC:Normal,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC",
          },
        },
      },
    },
  },
}
