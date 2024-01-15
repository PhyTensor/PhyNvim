local M = { "nvim-treesitter/nvim-treesitter" }

M.enabled = true

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.dependencies = {
    "nvim-treesitter/playground",
}

M.build = ":TSUpdate"

function M.config()
    require("nvim-treesitter.configs").setup({
        sync_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            use_languagetree = false,
            disable = function(_, bufnr)
                -- disable on size limit reached
                local buf_name = vim.api.nvim_buf_get_name(bufnr)
                local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
                return file_size > 256 * 1024
            end
        },
        indent = {
            enable = true,
            disable = { "dart" },
        },
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
            "markdown_inline",
            "yaml",
            "sql",
            "dart",
        },
    })
end

return M
