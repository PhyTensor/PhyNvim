vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Enable LazyVim auto format
vim.g.autoformat = true

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

vim.g.zoxide_use_select = true

vim.scriptencoding = "utf-8"

vim.loader.enable()

require("config.options")

-- bootstrap lazy.nvim and plugins
require("config.lazy")

require("config.autocmds")

require("config.keymaps")

require("config.colorscheme")
