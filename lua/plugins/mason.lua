return {
    "williamboman/mason.nvim",
    enabled = true,
    lazy = true,
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
        ensure_installed = {
            "mypy",
            -- "black",
            "pyright",
            "ktlint",
            "eslint_d",
            "eslint-lsp",
            "ruff",
            "prettier",
            "prettierd",
            "stylua",
            "csharpier",
            "isort",
            "yamlfix",
            "debugpy",
            "css-lsp",
            "typescript-language-server",
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                -- "ruff_lsp",
            },

            handlers = {
            },

            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end
}
