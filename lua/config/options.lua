-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Force Neovim to use per-user writable dirs for temp/run/swap/backup/undo.
-- This avoids crashes when /tmp or the default runtime dir is not writable.
local state = vim.fn.stdpath("state") -- ~/.local/state/nvim
local cache = vim.fn.stdpath("cache") -- ~/.cache/nvim
local run = state .. "/run"
local tmp = state .. "/tmp"
local dirs = {
  run,
  tmp,
  cache .. "/swap",
  cache .. "/backup",
  cache .. "/undo",
  state .. "/shada",
}
for _, dir in ipairs(dirs) do
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p", 448) -- 448 = 0700
  end
end

vim.env.XDG_RUNTIME_DIR = run
vim.env.TMPDIR = tmp

vim.opt.directory = cache .. "/swap//"
vim.opt.backupdir = cache .. "/backup//"
vim.opt.undodir = cache .. "/undo"
vim.opt.shadafile = state .. "/shada/main.shada"
