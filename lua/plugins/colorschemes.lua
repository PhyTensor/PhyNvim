return {
    -- {
    --     "catppuccin/nvim",
    --     lazy = true,
    --     name = "catppuccin",
    --     priority = 1000,
    --     opts = {
    --         transparent_background = true,
    --     },
    --     config = function(_, opts)
    --         require("catppuccin").setup(opts)
    --     end,
    -- },

    {
        "nobbmaestro/nvim-andromeda",
        lazy = true,
        priority = 1000,
        dependencies = {
            { "tjdevries/colorbuddy.nvim", branch = "dev" },
        },
        opts = {
            preset = "andromeda",
            transparent_bg = false,
        },
        config = function(_, opts)
            require("andromeda").setup(opts)
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = true,
        priority = 1000,
        opts = {
            transparent = false,
            italic_comments = true,
            hide_fillchars = true,
            borderless_telescope = true,
        },
        config = function(_, opts)
            require("cyberdream").setup(opts)
        end,
    },
    {
        "Mofiqul/dracula.nvim",
    },
    {
        "maxmx03/fluoromachine.nvim",
        enabled = true,
        lazy = true,     -- load immediately when starting neovim
        priority = 1000, -- load the colorscheme before other non-lazy-loaded plugins
        opts = {
            glow = false,
            theme = "auto",      -- 'fluoromachine', -- 'delta',-- 'retrowave',-- 'fluoromachine'
            transparent = false, -- 'full',-- true,
        },
        config = function(_, opts)
            require("fluoromachine").setup(opts)
            -- vim.cmd.colorscheme('fluoromachine')
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        enabled = true,
        priority = 1000,
        config = function()
            require("kanagawa").setup()
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        enabled = true,
        priority = 1000,
        opts = {
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold",
                },
            },
        },
        config = function(_, opts)
            require("nightfox").setup(opts)
        end,
    },
    {
        "nobbmaestro/nvim-andromeda",
        lazy = true,
        priority = 1000,
        dependencies = {
            { "tjdevries/colorbuddy.nvim", branch = "dev" },
        },
        opts = {
            preset = "andromeda",
            transparent_bg = false,
        },
    },
    {
        "navarasu/onedark.nvim",
        opts = {
            style = 'deep',       -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false,  -- Show/hide background
            ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
            -- Plugins Config --
            diagnostics = {
                darker = true,     -- darker colors for diagnostic
                undercurl = true,  -- use undercurl instead of underline for diagnostics
                background = true, -- use background color for virtual text
            },
        },

    },
    {
        "sainnhe/sonokai",
        lazy = true,
        priority = 1000,
        config = function()
            vim.g.sonokai_transparent_background = "0"
            vim.g.sonkai_enable_italic = "1"
            vim.g.sonokai_style = "andromeda"
            -- vim.cmd.colorscheme("sonokai")
            vim.g.sonokai_cursor = "red"
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        opts = {
            style = "night",
        },
    },
}
