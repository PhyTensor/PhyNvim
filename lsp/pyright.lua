local blink = require("blink.cmp")

return {

	filetypes = { "python" },
	root_markers = {
		".git",
		".venv",
		".env",
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
	},
	before_init = function(_, config)
		local default_venv_path = util.path.join(vim.env.HOME, ".venv/bin/python")
		local strawberry_fields_venv_path = util.path.join(vim.env.HOME, ".venv_strawberryfields/bin/python")
		config.settings.python.pythonPath = default_venv_path
		config.settings.python.pythonPath = strawberry_fields_venv_path
	end,
	disableOrganizeImports = false,
	analysis = {
		useLibraryCodeForTypes = true,
		autoSearchPaths = true,
		diagnosticMode = "workspace", -- 'openFilesOnly'
		autoImportCompletions = true,
	},

	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities()),
}
