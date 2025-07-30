return {
	"Wansmer/treesj",
	enabled = true,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{
			"<leader>m",
			mode = { "n", "v" },
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
			desc = "Toggle split or join code block",
		},
		{
			"<leader>j",
			mode = { "n", "v" },
			function()
				require("treesj").join()
			end,
			desc = "[J]oin code block",
		},
		{
			"<leader>ss",
			mode = { "n", "v" },
			function()
				require("treesj").split()
			end,
			desc = "[S]plit code block",
		},
	},
}
