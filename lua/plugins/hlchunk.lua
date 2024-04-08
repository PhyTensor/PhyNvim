return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre" }, -- "UIEnter"
	opts = {},
	config = function(_, opts)
		require("hlchunk").setup(opts)
	end,
}
