return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
      { "<leader>lm", ":Laravel models<cr>", desc = "Laravel Models" },
    },
    opts = {
      -- Automatically detects Sail, Docker Compose, or local execution environments
      environment = {
        environments = { "sail", "docker_compose", "local" },
      },
    },
  },
}
