local M = { "folke/tokyonight.nvim" }

M.enabled = false

-- M.event = "VimEnter"

-- M.lazy = false

M.priority = 1000

function M.config()
    require("tokyonight").setup({
        style = "night"
    })

    -- vim.cmd.colorscheme("tokyonight")
end

return M
