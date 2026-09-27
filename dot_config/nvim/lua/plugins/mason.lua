return {
  -- gopls, goimports, gofumpt, delve, golangci-lint are already ensured by
  -- the lang.go/dap.core extras; only add what those don't cover.
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "impl",
        "gomodifytags",
      },
    },
  },
}
