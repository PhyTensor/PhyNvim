return {
    "supermaven-inc/supermaven-nvim",
    enabled = true,
    lazy = true,
    event = {
        "BufWritePre",
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        keymaps = {
            accept_suggestion = "<Return>",
            clear_suggestion = "<C-]>",
            accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true }, -- or { "cpp", }
        color = {
            suggestion_color = "#ffffff",
            cterm = 244,
        },
        log_level = "info",                -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = true,            -- disables built in keymaps for more manual control
        condition = function()
            return false
        end -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
    },
    config = function(_, opts)
        require("supermaven-nvim").setup(opts)

        vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })
    end,
}
