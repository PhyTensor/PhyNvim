-- All plugins have lazy=true. To load plugin on startup lazy=false
-- Listing of all default plusings and their definitions

-- THIRD-PARTY PLUGINS

local plugins = {
    require('plugins.mini_starter'),
    require("plugins.mini_animate"),
    require("plugins.colorizer"),
    require('plugins.nvim_lsp'),
    require('plugins.nvim_cmp'),
    require('plugins.telescope_nvim'),
    -- require("plugins.telescope_frecency"),
    require('plugins.treesitter'),
    require('plugins.nvimtree'),
    require('plugins.which_key'),
    require('plugins.nvim_autopairs'),
    require('plugins.comment'),
    require('plugins.lualine'),
    require('plugins.nvim_web_devicons'),
    require("plugins.nvim_surround"),
    require('plugins.neotree'),
    require('plugins.oil'),
    require("plugins.flash"),
    require("plugins.hardtime"),
    require('plugins.themery'),
    require('plugins.treesj'),
    require('plugins.noice'),
    require("plugins.lspsaga"),
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
    require("plugins.vim_illuminate"),
    require("plugins.zen_mode"),
    require("plugins.todo_comments"),
    require("plugins.refactoring"),
    require("plugins.duplicate"),
    require("plugins.legendary_nvim"),
    require("plugins.nvim_project"),
    require("plugins.hlchunk"),
    require("plugins.diffview"),
    require("plugins.hawtkeys"),

    -- colorschemes
    require("plugins.catppuccin"),
    require('plugins.fluoromachine'),
    require('plugins.synthwave84'),
    require('plugins.tokyonight'),
    require("plugins.andromeda"),
    require("plugins.rose_pine"),
    require("plugins.nightfox"),
    require("plugins.kanagawa"),
    require("plugins.cyberdream"),

    -- experimental

}

require("lazy").setup(
    plugins,
    {
        'configs.lazy_nvim',
    }


)
