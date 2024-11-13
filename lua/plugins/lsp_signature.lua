-- https://github.com/ray-x/lsp_signature.nvim
-- LSP signature hint as you type
return {
    "ray-x/lsp_signature.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },

    opts = {
        bind = false,
        handler_opts = {
            border = "rounded"
        }
    },
    config = function(_, opts)
        require 'lsp_signature'.setup(opts)
    end
}
