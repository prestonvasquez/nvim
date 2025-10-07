-- LazyVim already provides a complete treesitter configuration.
-- This file extends LazyVim's treesitter setup to add Go support.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- Add Go to the list of languages to ensure are installed
      -- This extends LazyVim's default ensure_installed list
      ensure_installed = { "go" },
    },
  },
}
