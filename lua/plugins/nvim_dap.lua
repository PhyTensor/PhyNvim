local M = { "mfussenegger/nvim-dap" }

M.enabled = true

M.lazy = true

M.opts = {}

-- M.event = "VeryLazy"

M.config = function(_, opts)
    -- require("core.mappings").load_mappings("dap")
    -- require("core.mappings")--.("dap")
end

return M
