return {
    "folke/drop.nvim",
    enabled = true,
    lazy = true,
    event = {
        "BufWritePre",
        "BufReadPre",
        "BufNewFile",
    },
    -- event = "VimEnter",
    opts = {
        screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
    }
}
