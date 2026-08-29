-- VS Code Dark+ colors for an authentic VS Code look.
return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Let the terminal's background show through, so Warp's
      -- opacity/blur applies to the whole editor.
      transparent = true,
      italic_comments = true,
      underline_links = true,
      -- Slightly darker floats/sidebars for depth, like VS Code panels.
      disable_nvimtree_bg = true,
      -- Clear backgrounds the theme doesn't cover with `transparent`,
      -- so the explorer and panels are see-through too.
      group_overrides = {
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        NeoTreeEndOfBuffer = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        -- The theme gives DimText a solid background; the expander
        -- chevrons link to it, which painted dark boxes behind them.
        NeoTreeDimText = { fg = "#666666", bg = "NONE" },
        NeoTreeExpander = { fg = "#808080", bg = "NONE" },
        -- Explorer: DrakoVim red folder icons, soft white-grey text.
        NeoTreeDirectoryIcon = { fg = "#D16969" },
        NeoTreeDirectoryName = { fg = "#D4D4D4" },
        -- Keep the root folder line readable but distinct.
        NeoTreeRootName = { fg = "#E5E5E5", bold = true },
        -- Dashboard art in the accent red (editor area is left untouched).
        SnacksDashboardHeader = { fg = "#D16969" },
        SnacksDashboardIcon = { fg = "#E38A8A" },
        -- Rotating motto under the DRAKOVIM banner.
        DrakoVimMotto = { fg = "#E38A8A", italic = true },
      },
    },
    config = function(_, opts)
      require("vscode").setup(opts)
    end,
  },

  -- Tell LazyVim to activate the VS Code theme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
