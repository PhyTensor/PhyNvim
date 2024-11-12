return {
    "karb94/neoscroll.nvim",
    enabled = true,
    lazy = true,
    event = {
        "BufWritePre",
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        -- Keys to be mapped to their corresponding default scrolling animation
        mappings = {
            '<C-u>', '<C-d>',
            '<C-b>', '<C-f>',
            '<C-y>', '<C-e>',
            'zt', 'zz', 'zb',
        },
        stop_eof = false, -- Stop at <EOF> when scrolling downwards
    },
    config = function(_, opts)
        require('neoscroll').setup(opts)
    end
}
