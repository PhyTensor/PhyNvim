local M = { "scottmckendry/cyberdream.nvim" }

M.enabled = true

M.lazy = true

M.priority = 1000

M.opts = {
    transparent = true,
    italic_comments = true,
    hide_fillchars = true,
    borderless_telescope = true,
}

M.config = function(_, opts)
    require("cyberdream").setup(opts)

    -- vim.cmd("colorscheme cyberdream")
end

return M
