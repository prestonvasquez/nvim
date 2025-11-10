-- LaTeX-specific keybindings for VimTeX
-- Using <leader>t (for TeX) prefix to avoid conflicts with LazyVim

-- Create a function to safely call VimTeX commands
local function safe_vimtex_cmd(cmd)
  return function()
    if vim.fn.exists(':' .. cmd) == 2 then
      vim.cmd(cmd)
    else
      vim.notify("VimTeX not loaded. Please wait or run :Lazy load vimtex", vim.log.levels.WARN)
    end
  end
end

local opts = { buffer = true, silent = true }

-- Compilation and viewing
vim.keymap.set("n", "<leader>tc", safe_vimtex_cmd("VimtexCompile"), vim.tbl_extend("force", opts, { desc = "TeX: Compile" }))
vim.keymap.set("n", "<leader>tv", safe_vimtex_cmd("VimtexView"), vim.tbl_extend("force", opts, { desc = "TeX: View PDF" }))
vim.keymap.set("n", "<leader>ts", safe_vimtex_cmd("VimtexStop"), vim.tbl_extend("force", opts, { desc = "TeX: Stop compilation" }))
vim.keymap.set("n", "<leader>tx", safe_vimtex_cmd("VimtexClean"), vim.tbl_extend("force", opts, { desc = "TeX: Clean aux files" }))
vim.keymap.set("n", "<leader>tX", safe_vimtex_cmd("VimtexClean!"), vim.tbl_extend("force", opts, { desc = "TeX: Clean all files" }))

-- Errors and status
vim.keymap.set("n", "<leader>te", safe_vimtex_cmd("VimtexErrors"), vim.tbl_extend("force", opts, { desc = "TeX: Show errors" }))
vim.keymap.set("n", "<leader>tl", safe_vimtex_cmd("VimtexLog"), vim.tbl_extend("force", opts, { desc = "TeX: View log" }))
vim.keymap.set("n", "<leader>ti", safe_vimtex_cmd("VimtexInfo"), vim.tbl_extend("force", opts, { desc = "TeX: VimTeX info" }))
vim.keymap.set("n", "<leader>tS", safe_vimtex_cmd("VimtexStatus"), vim.tbl_extend("force", opts, { desc = "TeX: Compilation status" }))

-- Table of contents
vim.keymap.set("n", "<leader>tt", safe_vimtex_cmd("VimtexTocOpen"), vim.tbl_extend("force", opts, { desc = "TeX: Table of contents" }))
vim.keymap.set("n", "<leader>tT", safe_vimtex_cmd("VimtexTocToggle"), vim.tbl_extend("force", opts, { desc = "TeX: Toggle TOC" }))

-- Word count
vim.keymap.set("n", "<leader>tw", safe_vimtex_cmd("VimtexCountWords"), vim.tbl_extend("force", opts, { desc = "TeX: Count words" }))

-- Context menu
vim.keymap.set("n", "<leader>tm", safe_vimtex_cmd("VimtexContextMenu"), vim.tbl_extend("force", opts, { desc = "TeX: Context menu" }))

-- Documentation  
vim.keymap.set("n", "<leader>td", safe_vimtex_cmd("VimtexDocPackage"), vim.tbl_extend("force", opts, { desc = "TeX: Package docs" }))

-- Quick compile and view shortcut (most used)
vim.keymap.set("n", "<leader>tb", function()
  if vim.fn.exists(':VimtexCompile') == 2 then
    vim.cmd("VimtexCompile")
    vim.cmd("VimtexView")
  else
    vim.notify("VimTeX not loaded. Please wait or run :Lazy load vimtex", vim.log.levels.WARN)
  end
end, vim.tbl_extend("force", opts, { desc = "TeX: Build and view" }))

-- Also keep the localleader mappings available (using backslash)
-- So you can use either <leader>t or <localleader> (backslash) prefix
