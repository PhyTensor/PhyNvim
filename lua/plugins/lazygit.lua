return {
    "kdheepak/lazygit.nvim",
    enabled = true,
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        "nvim-lua/plenary.nvim"
    }
}
