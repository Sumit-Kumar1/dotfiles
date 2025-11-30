return {
  -- folke's tokyo-night theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm", -- night, moon, etc
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- transparent nvim for realtime transparency effects
  -- {
  --   'tribela/transparent.nvim',
  --   event = 'VimEnter',
  --   config = function()
  --     require('transparent').setup({
  --       auto = true, -- Automatically applies transparency
  --       -- extra_groups = {}, -- Add specific groups to be transparent if needed
  --       -- excludes = {}, -- Exclude groups from being transparent
  --     })
  --   end,
  -- }
}
