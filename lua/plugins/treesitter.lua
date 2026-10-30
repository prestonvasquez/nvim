-- LazyVim already provides a complete treesitter configuration.
-- This file extends LazyVim's treesitter setup to add Go support.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Disable Tree-sitter entirely to avoid parser-related crashes
    enabled = false,
  },
}
