return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    lazy = true,
    priority = 100,
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-emoji",

        -- snippet engine
        "L3MON4D3/LuaSnip",         -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion i.e. completion engine for luasnip

        -- adds LSP completion capabilities
        "hrsh7th/cmp-nvim-lsp",

        -- for autocompletion
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path",   -- source for file system paths in commands
        "hrsh7th/cmp-cmdline",

        -- adds user friendly snippets
        "rafamadriz/friendly-snippets",
    },

    opts = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
    },

    -- Completion Configuration
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- configure snippet engine. load snippets we have installed. .lazy_load loads any snippet in our runtime path i.e. friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- local select_opts = { behavior = cmp.SelectBehavior.Select }
        local select_opts = { behavior = cmp.SelectBehavior.Insert }
        local confirm_ops = { behavior = cmp.ConfirmBehavior.Insert, select = true }

        -- luasnip.config.set_config {
        --     history = false,
        --     updateevents = "TextChanged,TextChangedI",
        -- }


        cmp.setup({

            --[[
                No item is preselected by default.
                It is needed for a better interaction with Copilot.
                Unless one item is explicitly selected, Tab button will complete Copilot suggestion and not CMP suggestion.
                If you want to automatically select the first item in the completion menu:
                    preselect = cmp.PreselectMode.Item,
            ]]
            preselect = cmp.PreselectMode.None,

            -- configure how nvim-cmp interacts with the snippet engine
            -- Enable LuaSnip to handle snippet expansion for nvim-cmp
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- control apprearance and settings for documentation window
            window = {
                documentation = cmp.config.window.bordered(),
                completion = cmp.config.window.bordered(),
            },

            completion = {
                -- completeopt = { autocomplete = false },
                completeopt = "menu,menuone,preview,noselect,noinsert",
            },

            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.score,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            -- customizing the apprearance of the completion menu
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, item)
                    local menu_icon = {
                        supermaven = " SUPERMAVEN",
                        nvim_lsp = "λ LSP",
                        luasnip = "⋗ LUASNIP",
                        buffer = "Ω BUFFER",
                        path = "🖫 PATH",
                    }

                    local kind_icons = {
                        Text = "󰉿 Text",
                        Method = "󰆧 Method",
                        Function = "󰊕 Function",
                        Constructor = " Constructor",
                        Field = "󰜢 Field",
                        Variable = "󰀫 Variable",
                        Class = "󰠱 Class",
                        Interface = " Interface",
                        Module = " Module",
                        Property = "󰜢 Property",
                        Unit = "󰑭 Unit",
                        Value = "󰎠 Value",
                        Enum = " Enum",
                        Keyword = "󰌋 Keyword",
                        Snippet = " Snippet",
                        Color = "󰏘 Color",
                        File = "󰈙 File",
                        Reference = "󰈇 Reference",
                        Folder = "󰉋 Folder",
                        EnumMember = " EnumMember",
                        Constant = "󰏿 Constant",
                        Struct = "󰙅 Struct",
                        Event = " Event",
                        Operator = "󰆕 Operator",
                        TypeParameter = " TypeParameter",
                        Supermaven = " Supermaven",
                    }

                    -- kind icons
                    item.kind = string.format("%s", kind_icons[item.kind])

                    -- menu icons
                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },


            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
                ["<C-j>"] = cmp.mapping.scroll_docs(4),  -- scroll forward
                ["<C-Space>"] = cmp.mapping.complete(),  -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(),         -- clear/cancel completion window

                -- ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
                ["<CR>"] = cmp.mapping.confirm(confirm_ops, { "i", "c" }), -- confirm selection

                -- Autocompletion with TAB
                -- if completion menu is visible, move to the next item. If line is empty,
                -- insert a Tab character. If cursor is inside a word, trigger completion menu
                ["<Tab>"] = cmp.mapping(function(fallback)
                    local col = vim.fn.col(".") - 1

                    if cmp.visible() then
                        cmp.select_next_item(select_opts)
                    elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item(select_opts)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- jump to the next/prev placeholder in the snippet
                ["<C-l>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<C-h>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- list all data sources nvim-cmp will use to populate the completion list
            -- Keywords:
            -- priority = allows nvim-cmp to sort out completion list. If not set, then order of set determines order of priority
            -- keyword_length = how many characters necessary to begin querying the source
            sources = cmp.config.sources({
                { name = "supermaven" },
                { name = "nvim_lsp",  keyword_length = 1 }, -- show suggestions based on response of an lsp
                { name = "luasnip",   keyword_length = 1 }, -- shows available snippets and expands them if they are chosen
                { name = "buffer",    keyword_length = 3 }, -- suggest words/text found within current buffer
                { name = "path" },                          -- autocomplete file system paths
            }),
        })

        -- '/' cmdline setup
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- ':' cmdline setup
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })
    end,
}
