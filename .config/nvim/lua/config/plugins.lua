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

  -- Colorscheme loaded first as plugins might set their theme to this.
  use {
    'folke/tokyonight.nvim',
    config = function()
      require('config.tokyonight')
      vim.cmd 'colorscheme tokyonight'
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.nvim-treesitter')]],
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {{ 'nvim-tree/nvim-web-devicons', opt = true }},
    config = [[require('config.lualine')]]
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = [[require('config.gitsigns')]]
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
