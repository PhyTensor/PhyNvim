return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    opts = {
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
            end,
        },
        indent = {
            enable = true,
            disable = { "dart", "gdscript", "python" },
        },
        auto_install = false, -- automatically install syntax support when entering a new file type buffer
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
