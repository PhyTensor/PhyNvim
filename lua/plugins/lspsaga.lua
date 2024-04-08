return {
	"nvimdev/lspsaga.nvim",
	enabled = false,
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	-- https://github.com/nvimdev/lspsaga.nvim/blob/main/lua/lspsaga/init.lua
	opts = function()
		return require("configs.lspsaga_options")
	end,
	config = function(_, opts)
		require("lspsaga").setup(opts)
	end,
}
