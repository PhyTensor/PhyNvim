local M = { "echasnovski/mini.animate" }

M.enabled = true

-- M.event = "VimEnter"

-- M.lazy = "VeryLazy" -- { "BufRead", "BufNewFile" }

M.version = '*'

M.opts = {}

M.config = function(_, opts)
    require("mini.animate").setup(opts)
end

return M
