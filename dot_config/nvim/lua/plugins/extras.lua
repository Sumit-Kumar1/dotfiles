return {
  -- hardtime: breaks bad habits, master vim motions
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  {
    "rusagaib/oas-preview.nvim",
    config = function()
      require("oas-preview").setup({
        port = "1111", -- up-to-you
        ui = "swagger", -- "swagger", "redoc", "stoplight"
        auto_open_url = true, -- false to disable it, default is true
        expose = true, -- if it true will serve app container to use local network ip with port 80, default are false
        os = "mac", -- "linux", "mac", "win", "wsl" if not set will use default "linux"
      })
    end,
  },
}
