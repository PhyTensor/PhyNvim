local M = { "mfussenegger/nvim-dap-python" }

M.ft = "python"

M.dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
}

M.config = function (_,opts)
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)
    -- require("core.mappings").load_mappings("dap_python")
    require("core.mappings")--.load_mappings("dap_python")
end

return M
