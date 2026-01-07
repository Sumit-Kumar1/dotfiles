return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  -- Configure LazyVim to load gruvbox
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   opts = { style = "moon" },
  -- },
  -- {
  --   "ray-x/starry.nvim",
  --   opts = {
  --     italics = {
  --       comments = true,
  --       strings = false,
  --       keywords = false,
  --       functions = false,
  --       variables = false,
  --     },
  --     contrast = {
  --       enable = true,
  --       terminal = true,
  --     },
  --     style = {
  --       name = "moonlight", -- other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
  --       disable = {}, -- a list of styles to disable
  --       fix = true,
  --       darker_contrast = false,
  --       daylight_switch = false,
  --       deep_black = false,
  --     },
  --   },
  -- },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      transparent = true,
      terminal_colors = true,
      dim_inactive = true,
      styles = { -- Style to be applied to different syntax groups
        comments = "italics", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "italics",
        types = "NONE",
        variables = "NONE",
      },
    },
  },
  -- {
  --   "kuri-sun/yoda.nvim",
  --   opts = {
  --     neo_tree = true,
  --     telescope = false,
  --     gitsigns = true,
  --     snacks = true,
  --     indent_blankline = true,
  --     dashboard = true,
  --     which_key = true,
  --     misc = true,
  --     mini = true,
  --     noice = true,
  --     trouble = true,
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
