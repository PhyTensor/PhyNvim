local M = { "kdheepak/lazygit.nvim" }

M.enabled = true

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.dependencies = {
    "nvim-lua/plenary.nvim"
}

return M
