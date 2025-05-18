return {
	'folke/snacks.nvim',
	enabled = true,
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		-- terminal = { enabled = true },
		words = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		{
			'<leader>gg',
			function()
				Snacks.lazygit()
			end,
			desc = 'Lazygit',
		},
		{
			'<leader>gb',
			function()
				Snacks.picker.git_branches()
			end,
			desc = 'Git Branches',
		},
		{
			'<leader>gl',
			function()
				Snacks.picker.git_log()
			end,
			desc = 'Git Log',
		},
		-- File Explorer
		{
			'<leader>e',
			function()
				Snacks.explorer()
			end,
			desc = 'File Explorer',
		},
		-- Other
		{
			'<leader>z',
			function()
				Snacks.zen()
			end,
			desc = 'Toggle Zen Mode',
		},
		{
			'<leader>bd',
			function()
				Snacks.bufdelete()
			end,
			desc = 'Delete Buffer',
		},
		{
			'<leader>un',
			function()
				Snacks.notifier.hide()
			end,
			desc = 'Dismiss All Notifications',
		},
		{
			'<C-t>',
			-- '<leader>tt',
			function()
				Snacks.terminal()
			end,
			desc = 'Toggle Terminal',
		},
	},
}
