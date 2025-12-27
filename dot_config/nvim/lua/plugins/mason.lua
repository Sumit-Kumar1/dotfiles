return {
  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "impl",
        "delve",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "golangci-lint",
      },
    },
  },
}
