return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- Customize the existing options or add new ones
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = vim.tbl_deep_extend("force", opts.filesystem.filtered_items or {}, {
        hide_dotfiles = false, -- Show hidden files
        hide_gitignored = false, -- Show files ignored by .gitignore
      })
    end,
  },
}
