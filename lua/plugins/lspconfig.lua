return {
	"neovim/nvim-lspconfig",
	enabled = false,
	lazy = true,
	event = {
		"BufWritePre",
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}
