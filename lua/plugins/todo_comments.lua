-- Highlight todo, notes, etc in comments
return {
	"folke/todo-comments.nvim",
	enabled = true,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
