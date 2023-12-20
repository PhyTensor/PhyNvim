local M = { 'NvChad/nvim-colorizer.lua' }

M.event = { "BufReadPre", "BufNewFile" }

M.config = function ()
    require("colorizer").setup()
end

return M
