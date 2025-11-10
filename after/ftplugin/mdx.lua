-- MDX: same as Markdown
vim.opt_local.colorcolumn = "80"
vim.opt_local.textwidth = 80
vim.opt_local.wrap = false
vim.opt_local.formatoptions = "tcqjn"

vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = 0,
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("silent! normal! ggVGgq")
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
  end,
})
