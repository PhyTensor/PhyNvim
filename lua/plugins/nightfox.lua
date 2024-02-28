local M = { "EdenEast/nightfox.nvim" }

-- M.lazy = true

M.enabled = true

M.priority = 1000

-- M.event = "VimEnter"

M.opts = {
    options = {
        styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
        }
    }
}

M.config = function(_, opts)
    require("nightfox").setup(opts)
end

return M
