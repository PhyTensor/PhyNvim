return {
	"maxmx03/fluoromachine.nvim",
	enabled = true,
	lazy = true, -- load immediately when starting neovim
	priority = 1000, -- load the colorscheme before other non-lazy-loaded plugins
	config = function()
		local fm = require("fluoromachine")

		fm.setup({
			glow = false,
			theme = "auto", -- 'fluoromachine', -- 'delta',-- 'retrowave',-- 'fluoromachine'
			transparent = false, -- 'full',-- true,
		})

		-- vim.cmd.colorscheme('fluoromachine')
	end,
}
