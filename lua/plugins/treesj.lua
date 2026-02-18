local utils = require("config.utils")

require("treesj").setup()

local keys = {
	{
		{ "n", "v" },
		"<leader>m",
		function()
			require("treesj").toggle({ split = { recursive = true } })
		end,
		{ desc = "Toggle split or join code block" },
	},
	{
		{ "n", "v" },
		"<leader>j",
		function()
			require("treesj").join()
		end,
		{ desc = "[J]oin code block" },
	},
	{
		{ "n", "v" },
		"<leader>ss",
		function()
			require("treesj").split()
		end,
		{ desc = "[S]plit code block" },
	},
}

utils.set_keymaps(keys)
