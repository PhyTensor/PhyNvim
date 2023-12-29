-- Define your keymaps, commands, and autocommands as simple Lua tables,
-- building a legend at the same time (like VS Code's Command Palette).

local M = { 'mrjones2014/legendary.nvim' }

-- since legendary.nvim handles all your keymaps/commands,
-- its recommended to load legendary.nvim before other plugins
M.priority = 10000
-- M.lazy = false

M.event = "VeryLazy"

M.version = "*"

M.dependencies = {
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
}

return M
