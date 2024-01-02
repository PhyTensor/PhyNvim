local M = {
    'stevearc/dressing.nvim', -- optional for vim.ui.select
}

M.lazy = true

-- M.event = "VeryLazy"

M.opts = {}

M.config = function(_, opts)
    require("dressing").setup(opts)
end

return M
