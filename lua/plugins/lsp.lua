return {
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		enabled = true,
		lazy = true,
		event = {
			"BufWritePre",
			"BufReadPre",
			"BufNewFile",
		},
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = true,
		lazy = true,
		event = {
			"BufWritePre",
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = { "mason-org/mason.nvim" },
		opts = {},
		config = function()
			require("lsp.lsp").setup_servers()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
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
		config = function()
			require("lsp.lsp").setup_handlers()
		end,
	},
}
