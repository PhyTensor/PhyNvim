return {
    "kdheepak/lazygit.nvim",
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        "nvim-lua/plenary.nvim"
    }
}
