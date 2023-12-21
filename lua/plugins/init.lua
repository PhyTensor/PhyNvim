-- All plugins have lazy=true. To load plugin on startup lazy=false
-- Listing of all default plusings and their definitions

-- THIRD-PARTY PLUGINS

local plugins = {
    require('plugins.mini_starter'),
    require("plugins.colorizer"),
    require("plugins.andromeda"),
    require('plugins.nvim_lsp'),
    require('plugins.nvim_cmp'),
    require('plugins.tokyonight'),
    require('plugins.telescope'),
    require('plugins.treesitter'),
    require('plugins.nvimtree'),
    require('plugins.which_key'),
    require('plugins.nvim_autopairs'),
    require('plugins.comment'),
    require('plugins.indent_blankline'),
    require('plugins.lualine'),
    require('plugins.nvim_web_devicons'),
    require('plugins.neotree'),
    require('plugins.oil'),
    require('plugins.fluoromachine'),
    require('plugins.synthwave84'),
    require('plugins.themery'),
    require('plugins.treesj'),
    require('plugins.noice'),
    require('plugins.bufferline'),
    require('plugins.inc_rename'),
    require('plugins.mason'),
    require('plugins.trouble_nvim'),
    require("plugins.flutter_tools"),
    require("plugins.nvim_dap"),
    require("plugins.nvim_dap_ui"),
    require("plugins.nvim_dap_python"),
    require("plugins.lazygit"),
    require("plugins.gitsigns"),
    require("plugins.dressing"),
    require("plugins.autosession"),
    require("plugins.none_ls"),
    require("plugins.conform"),
    require("plugins.nvim_lint"),

    -- experimental
    -- require('plugins.themes'),
}

require("lazy").setup(
    plugins,
    {
        'configs.lazy_nvim'
    }
)
