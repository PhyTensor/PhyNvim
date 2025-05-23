-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable LazyVim auto format
vim.g.autoformat = true

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

require 'config.lazy'

require 'config.colorscheme'
