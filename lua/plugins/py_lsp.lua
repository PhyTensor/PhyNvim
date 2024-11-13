return {
    'HallerPatrick/py_lsp.nvim',
    enabled = true,
    lazy = true,
    ft = { "python" },
    event = {
        "BufWritePre",
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        -- This is optional, but allows to create virtual envs from nvim
        host_python = "/path/to/python/bin",
        default_venv_name = "~/Documents/pydev/venv" -- For local venv
    },
    config = function(_, opts)
        require("py_lsp").setup(opts)
    end,
}
