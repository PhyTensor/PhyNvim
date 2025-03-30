return {
    'rebelot/kanagawa.nvim',
    lazy = true,
    enabled = true,
    priority = 1000,
    opts = {
        undercurl = true,
        keywordStyle = { italic = true },
        statstatementStyle = { bold = true },
        transparent = false,
        terminalColors = true,
        colors = { -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = 'wave', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
            dark = 'wave', -- try "dragon" !
            light = 'lotus',
        },
    },
    config = function(_, opts)
        require('kanagawa').setup(opts)
    end,
}
