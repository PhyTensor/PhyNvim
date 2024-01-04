local M = { "rebelot/kanagawa.nvim" }

M.enabled = false

M.config = function()
    require("kanagawa").setup()
end

return M
