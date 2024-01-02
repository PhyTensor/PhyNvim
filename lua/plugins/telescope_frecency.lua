local M = { "nvim-telescope/telescope-frecency.nvim" }

M.config = function()
    require("telescope").load_extension("frecency")
end

return M
