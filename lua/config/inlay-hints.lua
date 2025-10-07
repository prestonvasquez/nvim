-- Inlay hints toggle functionality
local M = {}

-- Track the current state of inlay hints
local inlay_hints_enabled = false

-- Function to toggle inlay hints for Go files
function M.toggle_inlay_hints()
  local clients = vim.lsp.get_clients({ name = "gopls" })
  
  if #clients == 0 then
    vim.notify("No gopls client found", vim.log.levels.WARN)
    return
  end

  -- Toggle the state
  inlay_hints_enabled = not inlay_hints_enabled
  
  for _, client in ipairs(clients) do
    if client.server_capabilities.inlayHintProvider then
      if inlay_hints_enabled then
        -- Enable inlay hints
        vim.lsp.inlay_hint.enable(true, { bufnr = vim.api.nvim_get_current_buf() })
        
        -- Also update gopls settings to enable hints
        client.config.settings.gopls.hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        }
        
        vim.notify("Inlay hints enabled", vim.log.levels.INFO)
      else
        -- Disable inlay hints
        vim.lsp.inlay_hint.enable(false, { bufnr = vim.api.nvim_get_current_buf() })
        
        -- Also update gopls settings to disable hints
        client.config.settings.gopls.hints = {
          assignVariableTypes = false,
          compositeLiteralFields = false,
          compositeLiteralTypes = false,
          constantValues = false,
          functionTypeParameters = false,
          parameterNames = false,
          rangeVariableTypes = false,
        }
        
        vim.notify("Inlay hints disabled", vim.log.levels.INFO)
      end
      
      -- Request workspace configuration update
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
  end
end

-- Function to enable inlay hints (for manual enabling)
function M.enable_inlay_hints()
  if not inlay_hints_enabled then
    M.toggle_inlay_hints()
  end
end

-- Function to disable inlay hints (for manual disabling)
function M.disable_inlay_hints()
  if inlay_hints_enabled then
    M.toggle_inlay_hints()
  end
end

-- Create user commands
vim.api.nvim_create_user_command("ToggleInlayHints", M.toggle_inlay_hints, {
  desc = "Toggle inlay hints for Go files"
})

vim.api.nvim_create_user_command("EnableInlayHints", M.enable_inlay_hints, {
  desc = "Enable inlay hints for Go files"
})

vim.api.nvim_create_user_command("DisableInlayHints", M.disable_inlay_hints, {
  desc = "Disable inlay hints for Go files"
})

return M