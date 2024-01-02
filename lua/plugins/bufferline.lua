local M = { 'akinsho/bufferline.nvim' }

M.lazy = true

M.event = {
    "BufReadPre", -- load whenever we opoen new buffer or pres existing file
    "BufNewFile"  -- load whenever we open new file or new buffer
}

M.version = "*"

M.dependencies = {
    'nvim-tree/nvim-web-devicons'
}

M.keys = {
    { '<Tab>',   '<Cmd>BufferLineCycleNext<CR>', desc = "Next buffer tab" },
    { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = "Prev buffer tab" },
}

M.opts = {
    options = {
        -- mode "tabs",
        show_buffer_close_icons = false,
        show_close_icons = false,
    }
}

return M
