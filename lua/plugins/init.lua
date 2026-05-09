-- Extract plugin declaration
vim.pack.add({
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/rose-pine/neovim",                          name = "rose-pine" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",           version = "main",        build = ":TSUpdate" },
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/saghen/blink.cmp",                          version = "v1.8.0" },
    { src = "https://github.com/saghen/blink.compat" },
    { src = "https://github.com/seblyng/roslyn.nvim" },
    { src = "https://github.com/folke/snacks.nvim",                         name = "snacks" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/supermaven-inc/supermaven-nvim" },
    { src = "https://github.com/coffebar/neovim-project" },
    { src = "https://github.com/nvim-lua/plenary.nvim",                     name = "plenary" },
    { src = "https://github.com/Shatur/neovim-session-manager",             name = "session_manager" },
    { src = "https://github.com/folke/which-key.nvim",                      name = "which-key" },
    { src = "https://github.com/nvim-lualine/lualine.nvim",                 name = "lualine" },
    { src = "https://github.com/lewis6991/gitsigns.nvim",                   name = "gitsigns" },
    { src = "https://github.com/Wansmer/treesj",                            name = "treesj" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", name = "render-markdown" },
    { src = "https://github.com/aserowy/tmux.nvim" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
    { src = "https://github.com/GustavEikaas/easy-dotnet.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
})

require('plugins.onedark')
require('plugins.tokyonight')
require('plugins.catppuccin')
require('plugins.webdevicons')
require('plugins.treesitter')
require('plugins.fidget')
require('plugins.oil')
require('plugins.mason')
require('plugins.blink')
require('plugins.snacks')
require('plugins.fzf')
require('plugins.autopairs')
require('plugins.supermaven')
require('plugins.project')
require('plugins.whichkey')
require('plugins.lualine')
require('plugins.gitsigns')
require('plugins.treesj')
require('plugins.rendermarkdown')
require('plugins.tmux')
require('plugins.diffview')
require('plugins.indentblankline')
require('plugins.diagnostics')
require('plugins.easydotnet')
require('plugins.conform')

-- vim.print(vim.pack.get())
-- vim.pack.del({"nvim-treesitter"})

local function pack_clean()
    local active_plugins = {}
    local unused_plugins = {}

    local all_plugins = vim.pack.get()

    for _, plugin in ipairs(all_plugins) do
        active_plugins[plugin.spec.name] = plugin.active
    end

    for _, plugin in ipairs(all_plugins) do
        if not active_plugins[plugin.spec.name] then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        vim.notify("No unused plugins found")
        return
    end

    local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end

local utils = require('config.utils')

local keys = {
    { "n", "<leader>pc", pack_clean, { desc = "Clean unused plugins" } }
}

utils.set_keymaps(keys)
