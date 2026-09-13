-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Example: Disable heavy features for large files or JSON buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(args)
    local max_filesize = 1000 * 1024 -- 1000KB
    local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(args.buf))
    if stats and stats.size > max_filesize then
      vim.b[args.buf].large_buf = true
      vim.cmd("syntax off")
      vim.diagnostic.enable(false, { bufnr = args.buf })
      vim.b.completion = false
    end
  end,
})
