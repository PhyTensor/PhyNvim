local M = { "williamboman/mason.nvim" }

M.event = "VeryLazy"

M.dependencies = {
    "williamboman/mason-lspconfig.nvim",
}

M.opts = {
    ensure_installed = {
        -- LSP
        'clangd',
        'csharp-language-server',
        'json-lsp',
        'lua-language-server',
        'python-lsp-server',
        'yaml-language-server',
        -- DAP
        -- Linter
        'luacheck',
        -- Formatter
        'clang-format',
    },
}

M.config = function(_, opts)
    require('mason').setup(opts)
end

return M
