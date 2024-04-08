return {
    "folke/which-key.nvim",
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require("which-key")

        local mappings = {
        ["<Leader>"] = {
            ["?"] = { "<Cmd>WhichKey<CR>", "Keys" },
            e = { name = "explore" },
            f = { name = "find" },
        },
    }

    require("which-key").register(mappings)
    end,
}
