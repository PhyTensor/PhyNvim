return {
    "folke/todo-comments.nvim",
    enabled = true,
    lazy = true,
    event = { "BufRead" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        signs = false,
    },
    config = function(_, opts)
        require("todo-comments").setup(opts)
    end,
}
