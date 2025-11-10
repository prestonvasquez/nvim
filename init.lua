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

-- Auto rsync like-dl project to haldh on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "/Users/prestonvasquez/Developer/like-dl/*",
  callback = function()
    vim.fn.jobstart("rsync -avz --delete --exclude='.git' --exclude='bin/ml-train' --exclude='bin/ml-predict' --exclude='venv' /Users/prestonvasquez/Developer/like-dl/ haldh:/stock/m2/dl/", {
      detach = true
    })
  end,
})
