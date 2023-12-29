local M = { 'nvimdev/lspsaga.nvim' }

M.enabled = false

M.event = "VeryLazy"

M.dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
}

-- https://github.com/nvimdev/lspsaga.nvim/blob/main/lua/lspsaga/init.lua
M.opts = function()
    return require("configs.lspsaga_options")
end

M.config = function(_, opts)
    require("lspsaga").setup(opts)
end

return M
