return {
    "folke/zen-mode.nvim",
    lazy = true,
    opts = {
    window = {
        backdrop = 0.95,
        width = 100,
        height = 0.90,
        options = { signcolumn = "no", number = true, cursorline = false }
    },
    plugins = {
        options = { enabled = true, ruler = false, showcmd = false },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false }
    }
},
keys = {
    { "<leader>zz", mode = "n", "<Cmd>ZenMode<CR>", desc = "zen mode" },
},
-- config = function(_, opts)
    -- require("zen-mode").setup(opts)
-- end
}
