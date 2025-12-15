-- Extract plugin declaration
vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim",                          name = "catppuccin" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter",          version = "master" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                         version = "v1.8.0" },
	{ src = "https://github.com/saghen/blink.compat" },
	{ src = "https://github.com/seblyng/roslyn.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim",                    name = "plenary" },
	{ src = "https://github.com/Shatur/neovim-session-manager" },
	{ src = "https://github.com/coffebar/neovim-project" },
	{ src = "https://github.com/folke/which-key.nvim",                     name = "which-key" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim",                name = "lualine" },
	{ src = "https://github.com/folke/snacks.nvim",                        name = "snacks" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim",                  name = "gitsigns" },
	{ src = "https://github.com/Wansmer/treesj",                           name = "treesj" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/aserowy/tmux.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

require('plugins.webdevicons')
require('plugins.treesitter')
require('plugins.fidget')
require('plugins.oil')
require('plugins.mason')
require('plugins.blink')
require('plugins.fzf')
require('plugins.autopairs')
require('plugins.supermaven')
require('plugins.project')
require('plugins.whichkey')
require('plugins.lualine')
require('plugins.snacks')
require('plugins.gitsigns')
require('plugins.treesj')
require('plugins.markdownrender')
require('plugins.tmux')
require('plugins.diffview')
require('plugins.indentblankline')

-- vim.print(vim.pack.get())
-- vim.pack.del({"undotree"})
