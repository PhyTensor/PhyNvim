return {
    "zeioth/garbage-day.nvim",
    enabled = true,
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig" },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
    }
}
