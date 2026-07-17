local utils = require("config.utils")

require("flash").setup({
	labels = "asdfghjklqwertyuiopzxcvbnm",
	search = {
		multi_window = true,
		forward = true,
		wrap = true,
		mode = "exact",
		incremental = false,
	},
	jump = {
		jumplist = true,
		pos = "start",
		history = false,
		register = false,
		nohlsearch = false,
		autojump = false,
		clearcache = true,
	},
	modes = {
		search = {
			enabled = true,
		},
		char = {
			enabled = true,
			keys = { "f", "F", "t", "T", ";", "," },
			char_actions = function(motion)
				return {
					[";"] = "next",
					[","] = "prev",
					[motion:lower()] = "next",
					[motion:upper()] = "prev",
				}
			end,
		},
	},
})

local keys = {
	{ { "n", "x", "o" }, "s", function() require("flash").jump() end,              { desc = "Flash" } },
	-- { { "n", "x", "o" }, "S", function() require("flash").treesitter() end,        { desc = "Flash Treesitter" } },
	-- { "r",               "r", function() require("flash").remote() end,            { desc = "Remote Flash" } },
	-- { { "o", "x" },      "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" } },
	-- { { "c" },           "<c-s>", function() require("flash").toggle() end,            { desc = "Toggle Flash Search" } },
}

utils.set_keymaps(keys)
