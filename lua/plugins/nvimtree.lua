local M = { "nvim-tree/nvim-tree.lua" }

M.enabled = false

M.cmd = { "NvimTreeToggle", "NvimTreeFocus" }

M.event = "VeryLazy"

M.opts = function()
    return require("configs.nvimtree_options")
end

M.config = function(_, opts)
    -- dotfile(vim.g.base46_cache .. "nvimtree")
    require("nvim-tree").setup(opts)
end

return M
