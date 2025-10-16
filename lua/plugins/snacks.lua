require('snacks').setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = true },
	bufdelete = { enabled = false },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = false },
	input = { enabled = true },
	lazygit = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true, timeout = 3000 },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	terminal = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})

local keys = {
	{
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		desc = "Lazygit",
	},
	{
		"<leader>gb",
		function()
			Snacks.picker.git_branches()
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gl",
		function()
			Snacks.picker.git_log()
		end,
		desc = "Git Log",
	},
	-- File Explorer
	{
		"<leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
	},
	-- Other
	{
		"<leader>z",
		function()
			Snacks.zen()
		end,
		desc = "Toggle Zen Mode",
	},
	{
		"<leader>qn",
		function()
			Snacks.notifier.hide()
		end,
		desc = "Dismiss All Notifications",
	},
	{
		"<C-t>",
		-- '<leader>tt',
		function()
			Snacks.terminal()
		end,
		desc = "Toggle Terminal",
	},
}

for _, m in ipairs(keys) do
	local mode, lhs, rhs, opts
	if #m >= 4 then
		mode, lhs, rhs, opts = m[1], m[2], m[3], m[4]
	else
		mode, lhs, rhs, opts = "n", m[1], m[2], m[3]
	end
	vim.keymap.set(mode, lhs, rhs, opts or {})
end

