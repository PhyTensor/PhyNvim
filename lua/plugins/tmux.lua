return {
    "aserowy/tmux.nvim",
    enabled = true,
    lazy = true,
    event = {
        "BufWritePre",
        "BufReadPre",
        "BufNewFile",
    },
    opt = {},
    config = function(_, opts)
        require("tmux").setup(opts)
    end
}
