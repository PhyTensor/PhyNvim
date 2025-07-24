local blink = require("blink.cmp")

local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp/OmniSharp"

return {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
	enable_import_completion = true,
	organize_imports_on_format = true,
	filetypes = { "cs", "csproj", "sln" },
	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities()),
}
