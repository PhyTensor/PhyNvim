local M = { "williamboman/mason.nvim" }

M.event = {
    "BufReadPre",
    "BufNewFile"
}

M.dependencies = {
    "williamboman/mason-lspconfig.nvim",
}

M.opts = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
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
        -- debug (DAP)
        'debugpy',
    },
}

M.config = function(_, opts)
    require('mason').setup(opts)
end

return M
