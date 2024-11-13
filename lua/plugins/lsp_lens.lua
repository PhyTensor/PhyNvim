-- Neovim plugin for displaying references and difinition infos upon functions like JB's IDEA.
return {
    'VidocqH/lsp-lens.nvim',
    enabled = true,
    lazy = true,
    event = { "BufWritePre", "BufReadPre", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        require("lsp-lens").setup(opts)
    end
}
