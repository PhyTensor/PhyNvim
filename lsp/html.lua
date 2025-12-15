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
	root_markers = { "index.html", ".git", "package.json" },
	init_options = {
		provideFormatter = true,
		embeddedLanguages = { css = true, javascript = true },
		configurationSection = { "html", "css", "javascript" },
	},
}
