vim.g.github_function_style = "italic"
vim.g.github_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.github_colors = {
  hint = "orange",
  error = "#ff0000"
}

-- Load the colorscheme
-- vim.cmd("colorscheme tokyonight-night")
vim.cmd("colorscheme github_dark_default")
