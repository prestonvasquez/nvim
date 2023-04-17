-- Example config in Lua
require('github-theme').setup({
  options = {
    transparent = false,
    hide_end_of_buffer = true,
    hide_nc_statusline = true,
    styles = {
      comments = 'Italic',
      functions = 'NONE',
      keywords = 'Bold',
      variables = 'Underline',
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = { 'qf', 'vista_kind', 'terminal', 'packer' },
      },
    },
  },

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = { hint = 'orange', error = '#ff0000' },

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = '#282c34', sp = c.hint, style = 'underline' },
      DiagnosticHint = { link = 'LspDiagnosticsDefaultHint' },
      -- this will remove the highlight groups
      TSField = {},
    }
  end,
})

-- Load the colorscheme
vim.cmd("colorscheme github_dark_default")

vim.opt.colorcolumn = "80,120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg="#0E2E2E" })
