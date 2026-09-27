return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- if the project has a docker-compose.yml with an `app` service, run
        -- phpactor inside that container instead of on the host (e.g. when the
        -- project's PHP version isn't installable locally)
        phpactor = {
          on_new_config = function(new_config, new_root_dir)
            if vim.uv.fs_stat(new_root_dir .. "/docker-compose.yml") then
              new_config.cmd = { "docker", "compose", "exec", "-T", "app", "phpactor", "language-server" }
            end
          end,
        },
        -- deltas from the lang.go extra's defaults (gofumpt/vendor/useany on,
        -- ST1000/ST1020 enabled)
        gopls = {
          settings = {
            gopls = {
              gofumpt = false,
              codelenses = { vendor = false },
              analyses = {
                useany = false,
                ST1000 = false,
                ST1020 = false,
              },
            },
          },
        },
      },
    },
  },
}
