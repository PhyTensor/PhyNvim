return {
	"RRethy/vim-illuminate",
	event = { "BufRead" },
	opts = {
		-- providers: provider used to get references in the buffer, ordered by priority
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
