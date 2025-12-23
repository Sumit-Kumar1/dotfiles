return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        golangcilint = {
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
