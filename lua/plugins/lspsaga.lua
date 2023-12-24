local M = { 'nvimdev/lspsaga.nvim' }

M.enabled = false

M.event = "VeryLazy"

M.dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
}

M.opts = {
    ui = {
        border = "rounded"
    },
}

M.config = function(_, opts)
    require("lspsaga").setup(opts)
end

return M
