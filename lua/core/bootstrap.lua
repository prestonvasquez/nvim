-- Enable syntax highlighting
vim.cmd('syntax on')

-- Hide buffers instead of closing them
vim.opt.hidden = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Use unnamed clipboard
vim.opt.clipboard = 'unnamed'

-- Set the leader key to SPACE and disable its default function
vim.api.nvim_set_keymap('n', '<SPACE>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '

-- Set line numbers
vim.opt.number = true

-- Set folding method to syntax
vim.opt.foldmethod = "syntax"

-- Remove trailing whitespace when saving
vim.api.nvim_exec([[
  augroup trim_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]], false)

-- Map <C-n> to list buffers
vim.api.nvim_set_keymap("n", "<C-n>", ":ls<CR>:b<Space>", {noremap = true})

-- Format JSON on save
vim.cmd("autocmd FileType json autocmd BufWritePre <buffer> %!python3 -m json.tool")
