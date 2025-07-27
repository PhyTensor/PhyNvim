return {
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        enabled = false,
        lazy = true,
        event = {
            "BufWritePre",
            "BufReadPre",
            "BufNewFile",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        enabled = false,
        lazy = true,
        event = {
            "BufWritePre",
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            -- configure LSP servers
            -- ensure_installed = require("core.servers"),
            automatic_installation = false,
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
}
