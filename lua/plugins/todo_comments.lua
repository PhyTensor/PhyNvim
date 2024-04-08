return {
	"folke/todo-comments.nvim",
	event = { "BufRead" },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("todo-comments").setup(opts)
	end,
}
