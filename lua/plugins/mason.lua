return {
	"williamboman/mason.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			ensure_installed = {
				"mypy",
				"ktlint",
				"eslint_d",
				"ruff",
				"prettier",
				"prettierd",
				"stylua",
				"csharpier",
				"isort",
				"yamlfix",
				"debugpy",
				"css-lsp",
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ruff_lsp",
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
