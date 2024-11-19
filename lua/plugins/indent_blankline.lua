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
        indent = { highlight = highlight, char = "│" },
        whitespace = {
            highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = {
            enabled = false,
            show_start = false,
            show_end = false,
        },
    },
    config = function(_, opts)
        require("ibl").setup(opts)
    end,
}
