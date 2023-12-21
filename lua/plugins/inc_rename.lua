local M = { "smjonas/inc-rename.nvim" }

M.lazy = true

M.cmd = "IncRename"

M.config = function()
    require("inc_rename").setup()
end

return M
