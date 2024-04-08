local M = { "echasnovski/mini.animate" }

M.enabled = false

-- M.event = "VimEnter"

-- M.lazy = "VeryLazy" -- { "BufRead", "BufNewFile" }
M.lazy = lazy

M.version = '*'

M.opts = {}

M.config = function(_, opts)
    require("mini.animate").setup(opts)
end

return M
