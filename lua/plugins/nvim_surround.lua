local M = { "kylechui/nvim-surround" }

M.lazy = true

-- M.event = "VeryLazy"

M.version = "*"

M.opts = {}

M.config = function(_, opts)
    require("nvim_surround").setup(opts)
end

return M
