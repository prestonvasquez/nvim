-- bootstrap lazy.nvim, LazyVim and your plugins

-- Disable LSP hover immediately
require("config.disable-hover")

-- Load inlay hints configuration
require("config.inlay-hints")

require("config.lazy")

-- Show relative line numbers
vim.opt.relativenumber = true

-- Add the columns
vim.opt.colorcolumn = "80,120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#0E2E2E" })
