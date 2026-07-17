local utils = require("config.utils")

require("trouble").setup({
	auto_close = false, -- auto close when there are no items
	auto_open = false, -- auto open when there are items
	auto_preview = true, -- automatically preview the location of the item. If on_open is specified, it will be used instead.
	auto_refresh = true, -- auto refresh when open
	auto_jump = false, -- auto jump to the item when there's only one
	focus = false, -- focus the window when opened
	restore = true, -- restores the last used config when opened
	follow = true, -- follow the current item in the list
	indent_lines = true, -- add indent lines
	precached_buffers = true, -- precache buffers
	modes = {
		test = {
			mode = "diagnostics",
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.3,
			},
		},
	},
})

local keys = {
	{ "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              { desc = "Diagnostics (Trouble)" } },
	{ "n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" } },
	{ "n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      { desc = "Symbols (Trouble)" } },
	{ "n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		{ desc = "LSP Definitions / references / ... (Trouble)" } },
	{ "n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  { desc = "Location List (Trouble)" } },
	{ "n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   { desc = "Quickfix List (Trouble)" } },
}

utils.set_keymaps(keys)
