return {
    "akinsho/bufferline.nvim",
    enabled = true,
    lazy = true,
    event = {
        "BufReadPre", -- load whenever we opoen new buffer or pres existing file
        "BufNewFile", -- load whenever we open new file or new buffer
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "famiu/bufdelete.nvim",
    },
    opts = require("plugins_options.bufferline_options"),
    keys = {
        { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer tab" },
        { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer tab" },
    },
}
