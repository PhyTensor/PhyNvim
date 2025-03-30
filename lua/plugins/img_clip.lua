return {
    "HakonHarnes/img-clip.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    -- event = "VeryLazy",
    opts = {
        -- add options here
        -- or leave it empty to use the default settings
    },
    keys = {
        -- suggested keymap
        { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
}
