local M = { "nvim-treesitter/nvim-treesitter" }

M.enabled = true

M.event = "VeryLazy"

M.dependencies = {
    "nvim-treesitter/playground",
}

M.build = ":TSUpdate"

function M.config()
    require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = false, -- automatically install syntax support when entering a new file type buffer
        ensure_installed = {
            "lua",
            "bash",
            "python",
            "gitignore",
            "html",
            "css",
            "json",
            "markdown",
            "yaml",
            "sql",
            -- "dart",
        },
    })
end

return M
