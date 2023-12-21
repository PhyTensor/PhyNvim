local M = { "neovim/nvim-lspconfig" }

M.event = "VeryLazy"
-- M.event = {
--     "BufReadPre", -- load whenever we opoen new buffer or pres existing file
--     "BufNewFile"  -- load whenever we open new file or new buffer
-- }

M.dependencies = {
    -- LSP Manager plugins
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    "hrsh7th/cmp-nvim-lsp",

    { "antosha417/nvim-lsp-file-operations", config = true }, -- rename files through file exploerer and update affected import statements for LSPs that support it

    -- usefule status updates for LSP
    { 'j-hui/fidget.nvim',                   opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/neodev.nvim' },
}

-- M.opts = {
--     servers = {
--         dartls = {
--             -- add the dart language server setup here
--             cmd = { "dart", "language-server", "--protocol=lsp" },
--         },
--     },
-- }

-- M.opts = function()
--     require("lspconfig").dartls.setup({
--         cmd = { "dart", "language-server", "--protocol=lsp" },
--     })
-- end


M.config = function()
    require('mason').setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    })
    require('mason-lspconfig').setup({
        -- Update this list to the language servers you need installed
        ensure_installed = {
            "bashls", -- # requires npm to be installed
            -- "gdscript",
            -- "dartls",
            "jsonls",
            "csharp_ls",
            "pyright",
            -- "debugpy",
            -- "cssls", # requires npm to be installed
            -- "html", # requires npm to be installed
            -- "gradle_ls",
            -- "groovyls",
            "lua_ls",
            -- "intelephense", # requires npm to be installed
            -- "jsonls", # requires npm to be installed
            -- "lemminx",
            -- "marksman",
            -- "quick_lint_js",
            -- "tsserver", # requires npm to be installed
            "yamlls", -- # requires npm to be installed
        },

        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
    })

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lsp_attach = function(client, bufnr)
        -- Create your keybindings here...
    end

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
            })
        end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
        capabilities = lsp_capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    }

    local util = require('lspconfig.util')

    -- dartls
    lspconfig.dartls.setup {
        --     -- on_attach = on_attach,
        capabilities = lsp_capabilities,
        cmd = { "dart", 'language-server', '--protocol=lsp' },
        filetypes = { 'dart' },
        root_dir = util.root_pattern('pubspec.yaml'),
        init_options = {
            onlyAnalyzeProjectsWithOpenFiles = true,
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
            outline = true,
            flutterOutline = true,
        },
        settings = {
            dart = {
                completeFunctionCalls = true,
                showTodos = true,
                analysisExcludedFolders = {
                    vim.fn.expand("$HOME/flutter/bin/cache"),
                    vim.fn.expand("$HOME/.pub-cache/"),
                    vim.fn.expand("/use/bin/fish"),
                    vim.fn.expand("$HOME/flutter/"),
                },
            },
        },
    }

    -- pyright
    lspconfig.pyright.setup({
        -- on_attach = on_attach,
        capabilities = lsp_capabilities,
        filetypes = { "python" },
    })
end

return M
