local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'dense-analysis/ale'
  use 'ryanoasis/vim-devicons'

  -- Fuzzy Finder
  use {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1'
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'tveskag/nvim-blame-line'
  --use 'github/copilot.vim'
  use 'tpope/vim-rhubarb'

  -- Go
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries'
  }
  use 'sebdah/vim-delve'

  -- Rust
  use 'rust-lang/rust.vim'

  -- GUI
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'preservim/nerdtree'
  use 'psliwka/vim-smoothie' -- Smooth Scrolling
  use 'easymotion/vim-easymotion'
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  } -- Autocompletion

  -- PR Review
  -- use { 'ldelossa/gh.nvim', 'ldelossa/litee.nvim' }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  -- Themes
  use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use 'folke/tokyonight.nvim'
  use 'patstockwell/vim-monokai-tasty'

  -- Install ChatGPT plugin
  use {
    'jackMort/ChatGPT.nvim',
    run = ':UpdateRemotePlugins'
  }

  -- Install dependencies
  use 'MunifTanjim/nui.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


