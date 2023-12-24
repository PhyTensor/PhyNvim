local M = { "folke/todo-comments.nvim" }

M.event = "VeryLazy"

M.dependencies = {
    "nvim-lua/plenary.nvim"
}

M.opts = {}

M.config = function(_, opts)
    require("todo-comments").setup(opts)
end

return M
