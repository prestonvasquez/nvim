-- Globally disable LSP hover
vim.lsp.handlers["textDocument/hover"] = nil

-- Ensure it stays disabled even after LSP setup
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.lsp.handlers["textDocument/hover"] = nil
  end,
})

-- Also disable it on every filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.lsp.handlers["textDocument/hover"] = nil
  end,
})