return {
	"folke/trouble.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		return require("plugins_options.trouble_options")
	end,
	config = function(_, opts)
		require("trouble").setup(opts)
	end,
}
