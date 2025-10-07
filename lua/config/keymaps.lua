-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Go-specific keybinds for type information
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    local opts = { buffer = true, silent = true }
    
    -- Show type information under cursor (manual hover)
    vim.keymap.set("n", "K", function()
      -- Re-enable hover handler temporarily
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      -- Call hover
      vim.lsp.buf.hover()
      -- Disable it again after a short delay
      vim.defer_fn(function()
        vim.lsp.handlers["textDocument/hover"] = nil
      end, 100)
    end, vim.tbl_extend("force", opts, { desc = "Show type/documentation" }))
    
    -- Show type definition
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
    
    -- Show signature help (function parameters and return types)
    vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Show signature help" }))
    
    -- Toggle inlay hints (inline type information)
    vim.keymap.set("n", "<leader>gh", function()
      require("config.inlay-hints").toggle_inlay_hints()
    end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))
    
    -- Toggle completion documentation (for when you want to see types in completion)
    vim.keymap.set("n", "<leader>gd", function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      local doc_window = config.window.documentation
      
      if doc_window.max_height == 0 then
        -- Enable documentation
        cmp.setup({
          window = {
            documentation = {
              border = "rounded",
              max_height = 15,
              max_width = 60,
            }
          }
        })
        vim.notify("Completion documentation enabled", vim.log.levels.INFO)
      else
        -- Disable documentation
        cmp.setup({
          window = {
            documentation = {
              border = "rounded",
              max_height = 0,
              max_width = 0,
            }
          }
        })
        vim.notify("Completion documentation disabled", vim.log.levels.INFO)
      end
    end, vim.tbl_extend("force", opts, { desc = "Toggle completion docs" }))
  end,
})
