return {
	"itmecho/neoterm.nvim",
	enabled = true,
	lazy = true,
	opts = {
		clear_on_run = true, -- Run clear command before user specified commands
		position = "bottom", -- Position of the terminal window: fullscreen (0), top (1), right (2), bottom (3), left (4), center (5) (string or integer value)
		noinsert = false, -- Disable entering insert mode when opening the neoterm window
		width = 1.00, -- Width of the terminal window (percentage, ratio, or range between 0-1)
		height = 0.45,
	},
	keys = {
		{
			"<leader>tt",
			mode = { "n", "t" },
			"<CMD>NeotermToggle<CR>",
			desc = "Neoterm Toggle",
		},
		{
			"<leader>tx",
			mode = { "n", "t" },
			"<CMD>NeotermExit<CR>",
			desc = "Neoterm Exit",
		},
	},
}
