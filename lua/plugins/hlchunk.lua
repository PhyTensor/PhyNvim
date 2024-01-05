-- similar to indent-blankline, this plugin can highlight the indent line, and highlight the code chunk according to the current cursor position.
local M = { "shellRaining/hlchunk.nvim" }

M.event = { "BufReadPre" } -- "UIEnter"

M.opts = {}

M.config = function(_, opts)
    require("hlchunk").setup(opts)
end

return M
