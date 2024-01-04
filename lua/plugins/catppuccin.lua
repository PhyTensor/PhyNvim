local M    = { "catppuccin/nvim" }

-- M.lazy     = true

M.enabled  = true

M.event    = "VimEnter"

M.name     = "catppuccin"

M.priority = 1000

M.opts     = {}

M.config   = function(_, opts)
    require("catppuccin").setup(opts)
end

return M
