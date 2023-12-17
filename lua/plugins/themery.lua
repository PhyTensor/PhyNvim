require('plugins.synthwave84')

local M = { "zaldih/themery.nvim" }

-- Your list of installed colorschemes
-- M.themes = {
--     {
--         name = "Gruvbox",
--         colorscheme = "gruvbox",
--     },
--     {
--         name = "Synthwave84",
--         colorscheme = "synthwave84",
--     },
-- } 
--
-- M.themeConfigFile = "~/.config/nvim/lua/core/theme.lua" -- Described below
--
-- M.livePreview = true -- Apply theme while browsing. Default to true.

M.config = {
    themes = { "synthwave84" }, -- Your list of installed colorschemes
    themeConfigFile = "~/.config/nvim/lua/core/theme.lua", -- Described below
    livePreview = true, -- Apply theme while browsing. Default to true.
}

return M
