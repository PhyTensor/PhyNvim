local M = { "nvim-tree/nvim-web-devicons" }

M.enabled = true

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.opts = function()
    -- return { override = require "nvchad.icons.devicons" }
end

M.config = function(_, opts)
    -- dofile(vim.g.base46_cache .. "devicons")
    require("nvim-web-devicons").setup(opts)
end

return M
