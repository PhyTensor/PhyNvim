require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
    ensure_installed = {
		"pyrefly",
		"prettier",
		"prettierd",
		"ty",
		"typescript-language-server",
		"kotlin-lsp",
    },
})
