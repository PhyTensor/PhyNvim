-- install tree-sitter-cli for latex to work

return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/playground",
        "latex-lsp/tree-sitter-latex"
    },
    build = ":TSUpdate",
    opts = {
        sync_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            use_languagetree = false,
            disable = function(_, bufnr)
                -- disable on size limit reached
                local buf_name = vim.api.nvim_buf_get_name(bufnr)
                local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
                return file_size > 256 * 1024
            end,
        },
        indent = {
            enable = true,
            disable = { "dart", "gdscript", "python" },
        },
        auto_install = true, -- automatically install syntax support when entering a new file type buffer
        ensure_installed = {
            "lua",
            "bash",
            "fish",
            "python",
            "gitignore",
            "html",
            "css",
            "json",
            "javascript",
            "latex",
            "markdown",
            "markdown_inline",
            "yaml",
            "sql",
            "dart",
            "c_sharp",
            "gdscript",
            "godot_resource",
            "gdshader",
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
