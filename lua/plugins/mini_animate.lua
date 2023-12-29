local M = { "echasnovski/mini.animate" }

M.enabled = false

M.lazy = { "BufRead", "BufNewFile" }

M.version = '*'

M.opts = {}

M.config = function(_, opts)
    require("mini.animate").setup(opts)
end

return M
