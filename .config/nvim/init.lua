-- Neovim configuration.
require("config.settings")

-- Neovim keybindings. Plugin specific keybindings can override these and are
-- found in the config files for the different plugins.
require("config.keybindings")

-- Lazy bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy plugin spec and configuration
require("lazy").setup("plugins")
