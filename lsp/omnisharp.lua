local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp/OmniSharp"

return {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	root_markers = { ".git", ".sln", ".csproj" },
	filetypes = { "cs", "csproj", "sln" },
	enable_import_completion = true,
	organize_imports_on_format = true,
}
