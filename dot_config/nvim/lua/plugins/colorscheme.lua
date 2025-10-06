return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      terminal_colors = true,
      bold = true,
      transparent_mode = true,
      undercurl = true,
      underline = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = true,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true, -- inverse background for search , diff, statusline and errors
      contrast = "", -- "hard, soft, empty"
      dim_inactive = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
