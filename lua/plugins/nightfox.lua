local M = { "EdenEast/nightfox.nvim" }

M.enabled = true

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
