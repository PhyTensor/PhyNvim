return {
	name = "pyright",
	cmd = { "pyright" },
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
		local default_venv_path = vim.env.HOME .. ".venv/bin/python"
		local strawberry_fields_venv_path = vim.env.HOME .. ".venv_strawberryfields/bin/python"
		config.settings.python.pythonPath = default_venv_path
		config.settings.python.pythonPath = strawberry_fields_venv_path
	end,
	disableOrganizeImports = false,
	settings = {
		python = {
			analysis = {
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace", -- 'openFilesOnly'
				autoImportCompletions = true,
			},
		},
	},
}
