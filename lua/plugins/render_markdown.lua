return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	lazy = true,
	ft = { "markdown" },
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	}, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		heading = {
			width = "block",
			min_width = 50,
			border = true,
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
			foregrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
		},
		render_modes = { "n", "v", "i", "c" },
		checkbox = {

			unchecked = { icon = "󰄱 " },
			checked = { icon = " " },
			custom = { todo = { raw = "[>]", rendered = "󰥔 " } },
		},
		code = {
			position = "right",
			width = "block",
			left_pad = 2,
			right_pad = 4,
		},
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)
	end,
}
