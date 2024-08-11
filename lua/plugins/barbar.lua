return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = function()
      -- Custom key mappings for cycling through buffers
      vim.api.nvim_set_keymap("n", "<Tab>", ":BufferNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferPrevious<CR>", { noremap = true, silent = true })
    end,
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
}
