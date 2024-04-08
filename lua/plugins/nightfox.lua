return {
	"EdenEast/nightfox.nvim",
	lazy = true,
	enabled = true,
	priority = 1000,
	opts = {
		options = {
			styles = {
				comments = "italic",
				keywords = "bold",
				types = "italic,bold",
			},
		},
	},
	config = function(_, opts)
		require("nightfox").setup(opts)
	end,
}
