return {
    "j-hui/fidget.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        notification = {
            window = {
                winblend = 0,
            }
        },
    },
}
