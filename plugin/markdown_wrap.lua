-- Ensure Markdown/MDX reflow to 80 cols on save, regardless of ftplugin timing
local patterns = { "*.md", "*.mdx" }

-- Set buffer-local formatting options when opening Markdown/MDX
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = patterns,
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.wrap = false
    vim.opt_local.formatoptions = "tcqjn"
    vim.opt_local.colorcolumn = "80"
  end,
})

-- Reflow entire buffer on save (respects textwidth/formatoptions)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = patterns,
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("silent! normal! ggVGgq")
    pcall(vim.api.nvim_win_set_cursor, 0, pos)
  end,
})
