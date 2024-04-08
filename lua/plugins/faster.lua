local M = { "pteroctopus/faster.nvim" }

M.enabled = false

M.event = "VimEnter"

M.opts = {}

M.config = function(_, opts)
    require("faster").setup(opts)
end

return M
