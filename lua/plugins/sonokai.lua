return {
	"sainnhe/sonokai",
	lazy = true,
	priority = 1000,
	config = function()
		vim.g.sonokai_transparent_background = "0"
		vim.g.sonkai_enable_italic = "1"
		vim.g.sonokai_style = "andromeda"
		-- vim.cmd.colorscheme("sonokai")
		vim.g.sonokai_cursor = "red"
	end,
}
