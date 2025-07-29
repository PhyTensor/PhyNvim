return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = true,
	ft = { "markdown" },
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
}
