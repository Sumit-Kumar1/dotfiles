-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  watch_for_changes = true,
  view_options = {
    show_hidden = true,
  },
  float = {
    padding = 2,
    max_width = 0.35,
    max_height = 0.5,
    border = true,
    win_options = {
      winblend = 0.3,
    },
  },
  preview_split = 'auto',
  keymap = { 'n', '<leader>e', '<CMD>Oil<CR>', { desc = 'open oil file tree' } },
}
