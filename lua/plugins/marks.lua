return {
    'chentoast/marks.nvim',
    eanbled = false,
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('marks').setup {}
    end,
}
