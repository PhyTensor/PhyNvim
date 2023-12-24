local M = { "ThePrimeagen/refactoring.nvim" }

M.event = { "BufReadPre", "BufNewFile" }

M.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
}

M.config = function()
    require("refactoring").setup()
end

return M
