return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      formatting = {
        format = function(entry, vim_item)
          -- Remove type information from completion items for Go
          if vim.bo.filetype == 'go' then
            -- Keep only the label, remove detail and documentation
            vim_item.menu = nil
            -- Truncate long completion items
            if string.len(vim_item.abbr) > 50 then
              vim_item.abbr = string.sub(vim_item.abbr, 1, 50) .. "..."
            end
          end
          return vim_item
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        completion = {
          border = "rounded",
          scrollbar = false,
        },
        documentation = {
          border = "rounded",
          -- Hide documentation window by default for Go files
          max_height = vim.bo.filetype == 'go' and 0 or 15,
          max_width = vim.bo.filetype == 'go' and 0 or 60,
        },
      },
    },
  },
}