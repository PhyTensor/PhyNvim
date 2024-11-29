return {
    "Wansmer/treesj",
    enabled = true,
    lazy = true,
    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    },
    keys = {
        '<space>m', '<space>j', '<space>s'
    },
    config = function()
        require("treesj").setup({})
    end
}
