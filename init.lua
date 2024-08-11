-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

-- Show relative line numbers
vim.opt.relativenumber = true

-- Add the columns
vim.opt.colorcolumn = "80,120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#0E2E2E" })
