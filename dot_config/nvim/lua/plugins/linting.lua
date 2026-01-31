return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangci-lint" },
      },
      linters = {
        ["golangci-lint"] = {
          args = {
            "run",
            "--out-format",
            "json",
            "--show-stats=false",
            "--print-issued-lines=false",
            "--print-linter-name=false",
            "--fast", -- Recommended for editor integration
          },
        },
      },
    },
  },
}
