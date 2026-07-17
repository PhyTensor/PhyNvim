require("dressing").setup({
	input = {
		enabled = true,
		default_prompt = "Input:",
		trim_prompt = true,
		title_pos = "left",
		start_in_insert = true,
		border = "rounded",
		relative = "cursor",
		prefer_width = 40,
		width = nil,
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },
		win_options = {
			winblend = 10,
			winhighlight = "",
		},
	},
	select = {
		enabled = true,
		backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
		trim_prompt = true,
		builtin = {
			border = "rounded",
			relative = "editor",
			win_options = {
				winblend = 10,
				winhighlight = "",
			},
			width = nil,
			max_width = { 140, 0.8 },
			min_width = { 40, 0.2 },
			height = nil,
			max_height = 0.9,
			min_height = { 10, 0.2 },
		},
	},
})
