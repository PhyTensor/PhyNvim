return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- LSP Manager plugins
        {
            'williamboman/mason.nvim',
            opts = {
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                },
            },
        },
        'williamboman/mason-lspconfig.nvim',

        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        { 'j-hui/fidget.nvim', opts = {} },

        -- Allows extra capabilities provided by nvim-cmp
        -- 'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                -- Find references for the word under your cursor.
                map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                -- Rename the variable under your cursor.
                --  Most Language Servers support renaming across files, etc.
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                ---@param client vim.lsp.Client
                ---@param method vim.lsp.protocol.Method
                ---@param bufnr? integer some lsp support methods only in specific files
                ---@return boolean
                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has 'nvim-0.11' == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
                    local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd('LspDetach', {
                        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                    map('<leader>th', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                    end, '[T]oggle Inlay [H]ints')
                end
            end,
        })

        local lspconfig = require 'lspconfig'
        local util = require 'lspconfig.util'

        lspconfig.intelephense.setup {}

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        -- for type, icon in pairs(signs) do
        --   local hl = 'DiagnosticSign' .. type
        --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        -- end

        vim.diagnostic.config {
            severity_sort = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󱐋 ',
                },
            } or {},
            -- virtual_text = {
            --   source = 'if_many',
            --   spacing = 2,
            --   format = function(diagnostic)
            --     local diagnostic_message = {
            --       [vim.diagnostic.severity.ERROR] = diagnostic.message,
            --       [vim.diagnostic.severity.WARN] = diagnostic.message,
            --       [vim.diagnostic.severity.INFO] = diagnostic.message,
            --       [vim.diagnostic.severity.HINT] = diagnostic.message,
            --     }
            --     return diagnostic_message[diagnostic.severity]
            --   end,
            -- },
            virtual_lines = {
                source = 'if_many',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        }

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        --
        -- C# and dotnet
        local pid = vim.fn.getpid()
        local omnisharp_bin = '/usr/local/bin/omnisharp/OmniSharp'

        local servers = {
            -- clangd = {},
            -- gopls = {},
            -- rust_analyzer = {},
            -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
            --
            -- Some languages (like typescript) have entire language plugins that can be useful:
            --    https://github.com/pmizio/typescript-tools.nvim
            --
            -- But for many setups, the LSP (`ts_ls`) will work just fine
            ts_ls = {
                capabilities = capabilities,
                filetypes = { 'javascript', 'typescript' },
                init_options = {
                    preferences = {
                        disableSuggestions = true,
                    },
                },
            },

            omnisharp = {
                capabilities = capabilities,
                cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
                filetypes = { 'cs' },
            },

            lua_ls = {
                -- cmd = { ... },
                filetypes = { 'lua' },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { 'vim' },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            disable = { 'missing-fields' },
                        },
                        hint = {
                            enable = true,
                        },
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },

            -- pyright = {
            --     filetypes = { 'python' },
            --     capabilities = capabilities,
            --     before_init = function(_, config)
            --         local default_venv_path = util.path.join(vim.env.HOME, '.venv/bin/python')
            --         config.settings.python.pythonPath = default_venv_path
            --     end,
            -- },

            ruff = {
                filetypes = { 'python' },
                capabilities = capabilities,
                -- before_init = function(_, config)
                --     local default_venv_path = util.path.join(vim.env.HOME, '.venv/bin/python')
                --     config.settings.python.pythonPath = default_venv_path
                -- end,
                init_options = {
                    settings = {
                        logLevel = 'debug',
                        args = {},
                    },
                },
            },

            -- dartls = {
            --     capabilities = capabilities,
            --     cmd = { 'dart', 'language-server', '--protocol=lsp' },
            --     filetypes = { 'dart' },
            --     root_dir = util.root_pattern 'pubspec.yaml',
            --     init_options = {
            --         onlyAnalyzeProjectsWithOpenFiles = true,
            --         suggestFromUnimportedLibraries = true,
            --         closingLabels = true,
            --         outline = true,
            --         flutterOutline = true,
            --     },
            --     settings = {
            --         dart = {
            --             completeFunctionCalls = true,
            --             showTodos = true,
            --             analysisExcludedFolders = {
            --                 -- vim.fn.expand("$HOME/Android/flutter/bin/cache/"),
            --                 vim.fn.expand '$HOME/.pub-cache/',
            --                 vim.fn.expand '/usr/bin/fish',
            --                 -- vim.fn.expand("$HOME/Android/flutter/"),
            --             },
            --         },
            --     },
            -- },

            jsonls = {
                capabilities = capabilities,
                filetypes = { 'json' },
                settings = {
                    json = {
                        validate = { enable = true },
                        format = { eanble = true },
                    },
                },
            },

            -- gdscript = {
            --     capabilities = capabilities,
            --     filetypes = { 'gdscript', 'godot' },
            -- },
        }

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua', -- Used to format Lua code
            -- 'mypy',
            -- 'black',
            -- 'pyright',
            'ktlint',
            -- 'ruff',
            'ruff-lsp',
            'prettier',
            'prettierd',
            'stylua',
            'isort',
            'yamlfix',
            'debugpy',
            'css-lsp',
            'typescript-language-server',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    lspconfig[server_name].setup(server)
                end,
            },
        }
    end,
}
