return {
  -- Configure gopls settings via lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                functionTypeParameters = true,
              },
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
      },
    },
  },
  -- Ensure Mason always has these Go tools
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "goimports",
        "gofumpt",
        "gomodifytags",
        "golines",
        "impl",
        "delve",
        "golangci-lint",
      },
    },
  },
}
