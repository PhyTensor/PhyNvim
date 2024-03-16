local M = { "folke/tokyonight.nvim" }

M.enabled = true

M.lazy = true

M.priority = 1000

function M.config()
    require("tokyonight").setup({
        style = "night"
    })

    -- vim.cmd.colorscheme("tokyonight")
end

return M
