return {
    "m4xshen/hardtime.nvim",
    enabled = false,
    lazy = true,
    event = {
        "BufWritePre",
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
}
