-- Language servers. basedpyright's default "recommended" mode is much
-- stricter than VS Code / Pylance, and flags homework-style Python
-- (untyped parameters) as "unknown type" everywhere.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                -- "standard" matches typical VS Code Pylance behavior.
                -- Use "basic" if you still want fewer type warnings,
                -- or "off" to keep only syntax/import diagnostics.
                typeCheckingMode = "standard",
              },
            },
          },
        },
      },
    },
  },
}
