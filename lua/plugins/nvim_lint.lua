return {
    "mfussenegger/nvim-lint",
    enabled = true,
    lazy = true,
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            -- javascript = { "eslint_d" },
            -- typescript = { "eslint_d" },
            -- javascriptreact = { "eslint_d" },
            -- typescriptreact = { "eslint_d" },
            kotlin = { "ktlint" },
            -- svelte = { "eslint_d" },
            -- python = { "ruff", "pylint" },
        }

        -- Set pylint to work in virtualenv
        -- lint.linters.pylint.cmd = 'python'
        -- lint.linters.pylint.args = { '-m', 'pylint', '-f', 'json' }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        -- autocommand - check linters when on save file, leave insert mode
        -- If you want even more aggressive linting, add "TextChanged" to the table, meaning the linter will run every time you change text.
        -- https://www.reddit.com/r/neovim/comments/15pj1oi/using_nvimlint_as_a_nullls_alternative_for_linters/
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>tl", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
