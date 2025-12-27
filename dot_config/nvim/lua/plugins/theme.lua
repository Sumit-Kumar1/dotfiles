return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  -- -- Configure LazyVim to load gruvbox
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "moon" },
  -- },
  {
    "ray-x/starry.nvim",
    opts = {
      italics = {
        comments = true,
        strings = false,
        keywords = false,
        functions = false,
        variables = false,
      },
      contrast = {
        enable = true,
        terminal = true,
      },
      style = {
        name = "moonlight", -- other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
        disable = {}, -- a list of styles to disable
        fix = true,
        darker_contrast = false,
        daylight_switch = false,
        deep_black = false,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oceanic",
    },
  },
}
