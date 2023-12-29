local M = { "nobbmaestro/nvim-andromeda" }

M.lazy = true

M.enabled = false

M.dependencies = {
    { "tjdevries/colorbuddy.nvim", branch = "dev" },
}

M.config = function()
    require("andromeda").setup({
        preset = "andromeda",
        transparent_bg = true,
    })
end

return M
