return {
    "mfussenegger/nvim-dap-python",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    opts = {},
    config = function(_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        -- require("core.mappings").load_mappings("dap_python")
        -- require("core.mappings") --.load_mappings("dap_python")
    end,
}
