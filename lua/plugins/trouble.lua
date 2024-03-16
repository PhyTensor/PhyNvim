local M = { "folke/trouble.nvim" }

-- M.lazy = true

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.dependencies = {
    -- "nvim-tree/nvim-web-devicons",
}

M.opts = function()
    return require("configs.trouble_options")
end

M.config = function(_, opts)
    require("trouble").setup(opts)
end

return M
