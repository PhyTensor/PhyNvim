require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

require("config.lsp")

-- require("config.plugins")

vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    {
        src = "https://github.com/stevearc/oil.nvim",
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
    },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        opts = {
            autoinstall = true,
            highlight = {
                enable = true,
            },
        },
    },
    {
        src = "https://github.com/j-hui/fidget.nvim",
        opts = { notification = { window = { winblend = 0 } } },
    },
})

require("oil").setup()
require("nvim-treesitter").setup()
require("fidget").setup()

-- Set colorscheme after plugins are loaded
-- vim.cmd.colorscheme("catppuccin-mocha")

-- vim.cmd(":hi statusline guibg=NONE")
--https://github.com/mplusp/nvim-0.12-vim-pack-intro/blob/main/init.lua
--
