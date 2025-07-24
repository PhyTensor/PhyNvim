local blink = require("blink.cmp")

return {
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			validate = { enable = true },
			format = { eanble = true },
		},
	},

	capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities()),
}
