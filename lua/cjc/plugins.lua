local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- automatically call packer sync when plugins.lua is saved
vim.cmd [[
  augroup PackerAutoResync
    autocmd!
    autocmd! BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- quit early when packer isnt installed yet
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { }
    end
  }
}

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim"

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  use {
    'bluz71/vim-moonfly-colors',
    config = function ()
      vim.cmd[[ colorscheme moonfly ]]
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
