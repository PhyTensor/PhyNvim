return {
    "hinell/duplicate.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local legendary = require("legendary")
        legendary.keymaps({
            {
                description = "Line: duplicate up",
                mode = { "n" },
                "<C-S-A-Up>",
                "<CMD>LineDuplicate -1<CR>",
            },
            {
                description = "Line: duplicate down",
                mode = { "n" },
                "<C-S-A-Down>",
                "<CMD>LineDuplicate +1<CR>",
            },
            {
                description = "Selection: duplicate up",
                mode = { "v" },
                "<C-S-A-Up>",
                "<CMD>VisualDuplicate -1<CR>",
            },
            {
                description = "Selection: duplicate down",
                mode = { "v" },
                "<C-S-A-Down>",
                "<CMD>VisualDuplicate +1<CR>",
            },
        })
    end,
}
