-- Core Configuration
require('config.globals')
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugin Management
require('plugins')

-- Extract LSP enabling
vim.lsp.enable({
	"lua_ls",
	"pylsp",
	"godot",
	"omnisharp",
})

-- Extract colorscheme setup
vim.cmd.colorscheme("catppuccin-mocha")

