local highlight = {
    -- "CursorColumn",
    "Whitespace",
}

return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        exclude = { filetypes = { "dashboard" } },
        indent = {
            highlight = highlight,
            -- char = "│",
            char = "┊",
        },
        whitespace = {
            highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = {
            enabled = true,
            show_start = true,
            show_end = true,
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)
    end,
}
