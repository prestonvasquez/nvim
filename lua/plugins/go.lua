return {
  {
    "fatih/vim-go",
    config = function()
      -- Enable vim-go syntax highlighting features
      vim.g.go_highlight_types = 1
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_function_calls = 1
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_extra_types = 1
      vim.g.go_highlight_build_constraints = 1
      vim.g.go_highlight_generate_tags = 1
      
      -- Enable vim-go's LSP features with gopls
      vim.g.go_gopls_enabled = 1
      vim.g.go_code_completion_enabled = 1
      vim.g.go_def_mapping_enabled = 1
    end,
  },
}
