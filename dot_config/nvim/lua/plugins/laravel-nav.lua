return {
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = { "hrsh7th/nvim-cmp" }, -- Or blink.cmp if using LazyVim's newer variants
    ft = { "blade", "php" },
    opts = {
      close_keymaps = true, -- Inherits your global keymaps naturally
    },
  },
}
