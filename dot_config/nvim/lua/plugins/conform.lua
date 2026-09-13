return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- use goimports / gofumpt for formatting
      go = { "golangci-lint", "goimports", "gofmt" },
      php = { "pint" }, -- Prioritizes Pint for formatting .php files
    },
    format_on_save = {
      -- never fallback to LSP formatting if conform is configured
      lsp_format = "never",
    },
  },
}
