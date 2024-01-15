local M = { "m4xshen/hardtime.nvim" }

M.enabled = false

M.command = "Hardtime"

M.event = "BufEnter"

M.dependencies = {
    "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
}

M.opts = {}

M.config = function(_, opts)
    require("hardtime").setup(opts)
end

return M
