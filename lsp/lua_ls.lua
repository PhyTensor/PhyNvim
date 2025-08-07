return {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = {
		{ ".luarc.json", ".luarc.jsonc" },
		".git",
		".luacheckrc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = "luajit",
			},
			diagnostics = {
				disable = { "missing-fields", "missing-parameters" },
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "Snacks" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					vim.env.VIMRUNTIME,
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				setType = true,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
			completion = {
				-- callSnippet = "Replace",
			},
		},
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}

