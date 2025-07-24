local blink = require("blink.cmp")

return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"templ",
		"blade",
		"javascriptreact",
		"typescriptreact",
		"svelte",
	},
	settings = {},
	root_markers = { "index.html", ".git", "package.json" },
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities()),
}
