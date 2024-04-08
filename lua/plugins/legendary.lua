-- Define your keymaps, commands, and autocommands as simple Lua tables,
-- building a legend at the same time (like VS Code's Command Palette).

return {
	"mrjones2014/legendary.nvim",
	-- since legendary.nvim handles all your keymaps/commands,
	-- its recommended to load legendary.nvim before other plugins
	priority = 10000,
	-- M.lazy = true
	event = {
		"BufReadPre", -- load whenever we opoen new buffer or pres existing file
		"BufNewFile", -- load whenever we open new file or new buffer
	},
	version = "*",
	dependencies = {
		-- sqlite is only needed if you want to use frecency sorting
		-- dependencies = { 'kkharji/sqlite.lua' }
	},
}
