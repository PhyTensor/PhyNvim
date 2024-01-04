local M = { "mfussenegger/nvim-dap-python" }

M.enabled = true

-- M.lazy = true

M.event = { "BufReadPre", "BufNewFile" }

M.ft = "python"

M.dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
}

M.opts = {}

M.config = function(_, opts)
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)
    -- require("core.mappings").load_mappings("dap_python")
    -- require("core.mappings") --.load_mappings("dap_python")
end

return M
