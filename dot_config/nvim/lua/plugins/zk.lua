return {
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        -- See Setup section below
        picker = "snacks_picker",
        picker_options = {
          snacks_picker = {
            layout = {
              preset = "ivy",
            },
          },
        },
        lsp = {
          config = {
            name = "zk",
            cmd = { "zk", "lsp" },
            filetypes = { "markdown" },
          },
          -- auto attach buffers in a zk notebook
          --   auto_attach({
          --     enabled = true,
          --   }),
        },
      })
    end,
  },
}
