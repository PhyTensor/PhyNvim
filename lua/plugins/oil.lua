return {
	"stevearc/oil.nvim",
	lazy = true,
	event = "VeryLazy",
	priority = 100,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		return require("plugins_options.oil_options")
	end,
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}
