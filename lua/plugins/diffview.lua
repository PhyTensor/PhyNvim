return {
    "sindrets/diffview.nvim",
    lazy = true,
    event = { 'BufReadPre' },
    opts = {},
    config = function (_, opts)
        require("diffview").setup(opts)
    end
}
