return {
	"scottmckendry/cyberdream.nvim",
	lazy = true,
	priority = 1000,
	opts = {
		transparent = false,
		italic_comments = true,
		hide_fillchars = true,
		borderless_telescope = true,
	},
	config = function(_, opts)
		require("cyberdream").setup(opts)
	end,
}
