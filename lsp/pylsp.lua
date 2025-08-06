-- sudo pacman -Syu python-lsp-server
-- sudo pacman -Syu python-pyflakes python-isort python-pylint python-mccabe

return {
    cmd = { "pylsp" },
    filetypes = { "py", "python" },
    root_markers = {
        ".git",
        ".venv",
        ".env",
        "main.py",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
    },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false },
                pyflakes = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                mccabe = { enabled = true },
                pylint = { enabled = false }, -- very noisy
                pylsp_mypy = { enabled = false },
                pylsp_isort = { enabled = true },
                pyslp_black = { enabled = false },
            },
        },
    },
    -- before_init = function(_, config)
    --     local default_venv_path = vim.env.HOME .. ".venv/bin/python"
    --     local strawberry_fields_venv_path = vim.env.HOME .. ".venv_strawberryfields/bin/python"
    --     config.settings.python.pythonPath = default_venv_path
    --     config.settings.python.pythonPath = strawberry_fields_venv_path
    -- end,
    -- on_attach = function(client, bufnr)
    -- 	-- extend global configuration
    -- 	vim.lsp.config["*"].on_attach(client, bufnr)
    --
    -- 	-- "fix" gq
    -- 	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
    -- end,
}
