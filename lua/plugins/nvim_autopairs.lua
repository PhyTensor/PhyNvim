return {
    "windwp/nvim-autopairs",
    enabled = true,
    lazy = true,
    -- event = "InsertEnter",
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        "hrsh7th/nvim-cmp"
    },
    config = true,
    opts = {
        check_ts = true, -- enable treesitter
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
    },
}
