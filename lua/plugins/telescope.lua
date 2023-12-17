local M = { 'nvim-telescope/telescope.nvim' }

local function find(source)
    return function()
        require("telescope.builtin")[source]()
    end
end

M.cmd = "Telescope"

M.dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}

M.tag = '0.1.5'

M.opts = function()
    return require("configs.telescope")
end

M.config = function(_, opts)
    -- dofile(vim.g.base46_cache .. "telescope")
    local telescope = require("telescope")
    telescope.setup(opts)

    -- load extensions
    for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
    end
end

M.keys = {
    { '<leader>/', find("current_buffer_fuzzy_find"), desc = "Search" },
    { '<leader><Space>', find("buffers"), desc = "Buffers" },
    { '<leader>fa', find("autocommands"), desc = "Autocommands" },
    { "<Leader>fc", find("commands"), desc = "Commands" },
    { '<leader>ff', find("find_files"), desc = "Find Files" },
    { '<leader>fg', find("live_grep"), desc = "Live Grep" },
    { "<Leader>fh", find("help_tags"), desc = "Help" },
    { "<Leader>fl", find("loclist"), desc = "Location list" },
    { "<Leader>fq", find("quickfix"), desc = "Quickfix list" },
}

return M
