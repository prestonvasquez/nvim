return {
  "easymotion/vim-easymotion",
  config = function()
    -- additional configuration can be done here
  end,
  keys = {
    -- Remap <leader><space> to EasyMotion
    { "<leader><space>", "<Plug>(easymotion-bd-jk)" },
  },
}
