return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
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
