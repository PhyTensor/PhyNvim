return {
	"aserowy/tmux.nvim",
	enabled = true,
	opt = {},
	config = function()
		require("tmux").setup()
	end,
}
