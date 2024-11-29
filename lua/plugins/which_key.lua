return {
    "folke/which-key.nvim",
    enabled = true,
    lazy = true,
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    -- event = "VeryLazy",

    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },

    -- config = function()
    --     require("which-key")
    --
    --     local mappings = {
    --     ["<Leader>"] = {
    --         ["?"] = { "<Cmd>WhichKey<CR>", "Keys" },
    --         e = { name = "explore" },
    --         f = { name = "find" },
    --     },
    -- }
    --
    -- require("which-key").register(mappings)
    -- end,
}
