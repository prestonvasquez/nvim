return {
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ensure_installed = { "go", "javascript", "python", "lua" },
      }
    end,
    config = function(_, opts)
      -- Remove or comment out the line if not needed
      -- dofile(vim.g.base46_cache .. "syntax")

      -- Continue with setting up nvim-treesitter
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
