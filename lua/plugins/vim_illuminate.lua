local M = { "RRethy/vim-illuminate" }

M.event = "VeryLazy"

M.opts = {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
}

M.config = function(_, opts)
    require("illuminate").configure(opts)
end

return M
