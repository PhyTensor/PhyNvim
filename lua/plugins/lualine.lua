return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
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
