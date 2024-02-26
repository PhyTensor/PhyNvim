local M = { "ThePrimeagen/refactoring.nvim" }

M.event = { "BufReadPre", "BufNewFile" }

M.dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
}

M.opts = {}

M.keys = {
    {
        "<leader>rf",
        function()
            require("refactoring").select_refactor({ show_success_message = true, })
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
    },
}

M.config = function()
    require("refactoring").setup()
end

return M
