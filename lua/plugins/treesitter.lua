-- print("Plugins - treesitter")

local M = { "nvim-treesitter/nvim-treesitter" }

M.dependencies = {
    "nvim-treesitter/playground",
}

M.build = ":TSUpdate"

function M.config()
    require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
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
        },
    })
end

return M
