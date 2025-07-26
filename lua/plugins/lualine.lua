return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"linrongbin16/lsp-progress.nvim", -- LSP loading progress
			lazy = true,
		},
	},
	config = function()
		require("ui.ui").statusline()
	end,
}

