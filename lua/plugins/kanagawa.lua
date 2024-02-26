local M = { "rebelot/kanagawa.nvim" }

M.enabled = true

M.priority = 1000

M.config = function()
    require("kanagawa").setup()
end

return M
