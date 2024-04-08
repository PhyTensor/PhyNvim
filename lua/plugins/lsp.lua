return {
	"neovim/nvim-lspconfig",
	event = {
		"BufReadPre", -- load whenever we opoen new buffer or pres existing file
		"BufNewFile", -- load whenever we open new file or new buffer
	},
	dependencies = {
		-- LSP Manager plugins
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		"hrsh7th/cmp-nvim-lsp",

		-- rename files through file exploerer and update affected import statements for LSPs that support it
		{ "antosha417/nvim-lsp-file-operations", config = true },

		-- usefule status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		{ "folke/neodev.nvim" },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- for  creating custom keybindings
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local on_attach = function(bufnr, client)
			opts.buffer = bufnr

			-- set keybindings
			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>gr", "<Cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

			opts.desc = "Go to lsp definitions"
			keymap.set("n", "<leader>gd", "<Cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "<leader>gi", "<Cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>gt", "<Cmd> Telescope lsp_type_definitions <CR>", opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)

			opts.desc = "Smart Rename"
			keymap.set("n", "<leader>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)

			opts.desc = "Show buffer diagnostics for file"
			keymap.set("n", "<leader>gb", "<Cmd> Telescope diagnostics bufnr=0 <CR>", opts)

			opts.desc = "Show diagnostics for line"
			keymap.set("n", "<leader>gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

			opts.desc = "Go to prev diagnostic message in buffer"
			keymap.set("n", "<leader>gp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

			opts.desc = "Go to next diagnostic message in buffer"
			keymap.set("n", "<leader>gn", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)

			opts.desc = "Open diagnostic Quickfix list"
			keymap.set("n", "<leader>gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

			opts.desc = "Show hover documentation"
			keymap.set("n", "<leader>gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

			opts.desc = "Restart the LSP"
			keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

			opts.desc = "Signature help"
			keymap.set("n", "<leader>gs", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

			opts.desc = "format"
			keymap.set({ "n", "v" }, "<leader>gf", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)

			opts.desc = "Document symbol"
			keymap.set("n", "<leader>tr", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)

			opts.desc = "Bring up completion window"
			keymap.set("i", "<C-Space>", "<Cmd>lua vim.lsp.buf.completion()<CR>", opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Lua LSP settings
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- dartls
		lspconfig.dartls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "dart", "language-server", "--protocol=lsp" },
			filetypes = { "dart" },
			root_dir = util.root_pattern("pubspec.yaml"),
			init_options = {
				onlyAnalyzeProjectsWithOpenFiles = true,
				suggestFromUnimportedLibraries = true,
				closingLabels = true,
				outline = true,
				flutterOutline = true,
			},
			settings = {
				dart = {
					completeFunctionCalls = true,
					showTodos = true,
					analysisExcludedFolders = {
						-- vim.fn.expand("$HOME/Android/flutter/bin/cache/"),
						vim.fn.expand("$HOME/.pub-cache/"),
						vim.fn.expand("/usr/bin/fish"),
						-- vim.fn.expand("$HOME/Android/flutter/"),
					},
				},
			},
		})

		-- pyright
		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "python" },
		})

		-- C# and dotnet
		local pid = vim.fn.getpid()
		local omnisharp_bin = "/usr/local/bin/omnisharp/OmniSharp"
		lspconfig.omnisharp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
			filetypes = { "cs" },
		})

		-- Typescript and javascript
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})

		-- json
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				json = {
					validate = { enable = true },
					format = { eanble = true },
				},
			},
		})
	end,
}
