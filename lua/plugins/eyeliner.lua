return {
	"jinh0/eyeliner.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("eyeliner").setup({
			highlight_on_key = true,
			dim = true,
		})
	end,
}
