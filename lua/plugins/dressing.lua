-- Neovim plugin to improve the default vim.ui interfaces

return {
    "stevearc/dressing.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
}
