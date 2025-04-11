return {
    'Wansmer/treesj',
    enabled = true,
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = {
        '<leader>m',
        '<leader>j',
        '<leader>s',
    },
    config = function()
        require('treesj').setup {}
    end,
}
