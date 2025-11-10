return {
  "lervag/vimtex",
  ft = { "tex", "latex", "bib" }, -- Load VimTeX for tex/latex files
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration (these need to be set before plugin loads)
    
    -- Change VimTeX leader key to avoid conflict with LazyVim
    -- Use <localleader> instead of <leader> for VimTeX commands
    vim.g.maplocalleader = "\\" -- Use backslash as local leader
    -- Or use a different prefix like <leader>x for latex
    vim.g.vimtex_mappings_prefix = "<localleader>"
    
    -- Use macOS general viewer (will use Preview or default PDF app)
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_general_viewer = "open"
    vim.g.vimtex_view_general_options = "-a Preview"
    
    -- Compiler settings - use VimTeX generic backend with xelatex (two passes)
    -- This avoids requiring latexmk/latexrun and ensures TOC/crossrefs are resolved.
    vim.g.vimtex_compiler_method = "generic"
    vim.g.vimtex_compiler_generic = {
      command = "sh -lc 'cd \"$(dirname @tex)\" && xelatex -file-line-error -interaction=nonstopmode -synctex=1 -shell-escape \"$(basename @tex)\" && xelatex -file-line-error -interaction=nonstopmode -synctex=1 -shell-escape \"$(basename @tex)\"'",
    }
    
    -- Disable some features for better performance
    vim.g.vimtex_quickfix_mode = 0 -- Don't auto-open quickfix
    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }
    
    -- Completely disable folding to avoid compatibility issues
    vim.g.vimtex_fold_enabled = 0
    vim.g.vimtex_fold_manual = 0
    
    -- Disable syntax concealing by default (can enable if you want fancy math symbols)
    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_syntax_conceal_disable = 0
  end,
}
