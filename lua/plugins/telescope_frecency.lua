local M = { "nvim-telescope/telescope-frecency.nvim" }

M.enabled = true

M.lazy = true

M.config = function()
    require("telescope").load_extension("frecency")
end

return M
