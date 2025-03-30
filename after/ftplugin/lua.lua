-- [[
-- after/ftplugin/lua.lua is run after all the default configs
-- ftplugin = filetype plugin
-- ]]

local set = vim.opt_local

-- act specifically on just this file
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.expandtab = true
set.spell = false
set.wrap = true
