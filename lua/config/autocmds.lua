-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
  pattern = "*",
  callback = function()
    -- Save cursor position
    local save_cursor = vim.fn.getpos(".")
    
    -- Remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
    
    -- Restore cursor position
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Additional handling for markdown files to remove trailing spaces
-- but preserve intentional double spaces at end of lines (markdown line breaks)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimWhitespaceMarkdown", { clear = true }),
  pattern = { "*.md", "*.markdown" },
  callback = function()
    -- Save cursor position
    local save_cursor = vim.fn.getpos(".")
    
    -- Remove trailing whitespace but preserve double spaces at end of lines
    -- This regex matches 3 or more spaces, or 1 space followed by tabs/more spaces
    vim.cmd([[%s/\(\S\)\s\{3,\}$/\1  /e]])
    vim.cmd([[%s/\(\S\) \+\t\+$/\1  /e]])
    vim.cmd([[%s/\(\S\)\t\+$/\1/e]])
    vim.cmd([[%s/^\s\+$//e]])
    
    -- Restore cursor position
    vim.fn.setpos(".", save_cursor)
  end,
})
