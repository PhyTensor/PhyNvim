return {
	"akinsho/bufferline.nvim",
	lazy = true,
	event = {
		"BufReadPre", -- load whenever we opoen new buffer or pres existing file
		"BufNewFile", -- load whenever we open new file or new buffer
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			-- mode "tabs",
			show_buffer_close_icons = false,
			show_close_icons = false,
		},
	},
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer tab" },
	},
}
