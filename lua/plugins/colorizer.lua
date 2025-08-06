return {
	"NvChad/nvim-colorizer.lua",
	enabled = true,
	event = {
		"BufWritePre",
		"BufReadPre",
		"BufNewFile",
	},
	opts = {},
	config = function(_, opts)
		require("colorizer").setup(opts)
	end,
}
