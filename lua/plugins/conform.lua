-- formmatting
local M = { "stevearc/conform.nvim" }

M.enabled = true

-- M.lazy = true

M.event = { "BufReadPre", "BufNewFile" }

M.opts = {
    formatters_by_ft = {
        -- javascript = { "prettier" },
        -- typescript = { "prettier" },
        -- javascriptreact = { "prettier" },
        -- typescriptreact = { "prettier" },
        -- svelte = { "prettier" },
        -- css = { "prettier" },
        -- html = { "prettier" },
        json = { "prettier", "prettierd" },
        yaml = { "prettier", "yamlfix" },
        markdown = { "prettier", "prettierd" },
        -- graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    },
}

M.config = function(_, opts)
    local conform = require("conform")

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        })
    end, { desc = "Format file or range (in visual mode)" })

    conform.setup(opts)
end

return M
