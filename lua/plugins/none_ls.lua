return {
    "nvimtools/none-ls.nvim",
    enabled = false,
    lazy = true,
    ft = { "python" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    opts = {},
    config = function()
        local null_ls = require("null-ls")
        local null_ls_utils = require("null-ls.utils")

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- configure null_ls
        null_ls.setup({
            -- add package.json as identifier for root (for typescript monorepos)
            root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", "pubspec.yaml"),
            -- setup formatters & linters
            sources = {
                --  to disable file types use
                --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                null_ls.builtins.formatting.prettier.with({
                    extra_filetypes = {
                        -- "svelte",
                    },
                }),                                 -- js/ts formatter
                null_ls.builtins.formatting.stylua, -- lua formatter
                -- null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.ruff,
                -- null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.csharpier,
                -- null_ls.builtins.diagnostics.pylint,
                -- diagnostics.eslint_d.with({ -- js/ts linter
                --     condition = function(utils)
                --         return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
                --     end,
                -- }),
            },
            -- configure format on save
            on_attach = function(current_client, bufnr)
                if current_client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    --  only use null-ls for formatting instead of lsp server
                                    return client.name == "null-ls"
                                end,
                                bufnr = bufnr,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}
