require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Bootstrap lazy.nvim
require("core.lazy")

-- LSP
require("core.lsp")

-- Set colorscheme after plugins are loaded
vim.cmd.colorscheme("catppuccin-mocha")
