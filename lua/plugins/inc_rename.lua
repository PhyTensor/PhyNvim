-- A small Neovim plugin that provides a command for LSP renaming with immediate visual feedback thanks to Neovim's command preview feature

return {
    "smjonas/inc-rename.nvim",
    enabled = true,
    lazy = true,
    cmd = "IncRename",
    config = function()
        require("inc_rename").setup()
    end,
}
