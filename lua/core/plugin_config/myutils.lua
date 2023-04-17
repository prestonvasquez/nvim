local M = {}

function M.go_def_and_ref()
  -- Jump to the reference using go-def-vertical
  vim.api.nvim_command('normal <Plug>(go-def-vertical)')

  -- Get the object under the cursor and run :GoRef on it
  local object = vim.fn.expand('<cword>')
  vim.api.nvim_command('GoRef ' .. object)
end

return M

