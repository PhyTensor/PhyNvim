require('conform').setup({
    formatters_by_ft = {
        -- python = { "ruff" },
        python = { "ruff", "ruff_format", "ruff_organize_imports" },
		javascript = { "prettier", "prettierd" },
		typescript = { "prettier", "prettierd" },
		javascriptreact = { "prettier", "prettierd" },
		typescriptreact = { "prettier", "prettierd" },
    }
})
