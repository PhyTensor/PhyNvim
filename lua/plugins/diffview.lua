local M = { "sindrets/diffview.nvim" }

M.lazy = true

M.event = { "BufReadPre" }

M.opts = {}

M.config = function(_, opts)
    require("diffview").setup(opts)
end

return M
