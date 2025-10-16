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

for _, m in ipairs(keys) do
	local mode, lhs, rhs, opts
	mode, lhs, rhs, opts = m[1], m[2], m[3], m[4]
	vim.keymap.set(mode, lhs, rhs, opts or {})
end
