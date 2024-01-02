local M = { "stevearc/oil.nvim" }

M.enabled = true

M.event = {
    "BufReadPre", -- load whenever we opoen new buffer or pres existing file
    "BufNewFile"  -- load whenever we open new file or new buffer
}

M.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

M.opts = function()
    return require("configs.oil")
end

return M
