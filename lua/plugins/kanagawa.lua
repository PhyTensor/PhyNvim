return {
	"rebelot/kanagawa.nvim",
	lazy = true,
	enabled = true,
	priority = 1000,
	config = function()
		require("kanagawa").setup()
	end,
}
