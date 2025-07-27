local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp/OmniSharp"

return {
    root_markers = { ".git", ".sln", ".csproj" },
    filetypes = { "cs", "csproj", "sln" },
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    enable_import_completion = true,
    organize_imports_on_format = true,
}
