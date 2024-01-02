local M = { "nvim-neo-tree/neo-tree.nvim" }

M.enabled = true

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.branch = "v3.x"

M.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
}

return M
