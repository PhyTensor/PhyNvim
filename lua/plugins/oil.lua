local M = { "stevearc/oil.nvim" }

M.enabled = true

M.event = "VeryLazy"

M.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

M.opts = function()
    return require("configs.oil")
end

return M
