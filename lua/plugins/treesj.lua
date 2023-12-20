-- splitting/joining blocks of code like arrays, hashes, statements, objects, dicts e.t.c.
local M = { "Wansmer/treesj" }

M.lazy = true

M.keys = {
    '<space>m', '<space>j', '<space>s'
}

M.dependencies = {
    'nvim-treesitter/nvim-treesitter'
}

M.config = function()
    require('treesj').setup({})
end

return M
