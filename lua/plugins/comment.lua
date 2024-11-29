return {
    "numToStr/Comment.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring"
    },

    config = function()
        -- import comment plugin safely
        local comment = require("Comment")

        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        comment.setup({
            -- for commenting tsx and jsx files
            pre_hook = ts_context_commentstring.create_pre_hook(),
        })
    end,

    keys = {
        -- { "gcc", mode = "n",          desc = "Comment toggle current line" },
        -- { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
        -- { "gc", mode = "x",          desc = "Comment toggle linewise (visual)" },
        -- { "gbc", mode = "n",          desc = "Comment toggle current block" },
        -- { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
        -- { "gb", mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },

}
