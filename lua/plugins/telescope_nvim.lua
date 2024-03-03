local M = { 'nvim-telescope/telescope.nvim' }

local function find(source)
    return function()
        require("telescope.builtin")[source]()
    end
end

M.cmd = "Telescope"

M.event = { 'BufReadPre', 'BufNewFile' } -- "VeryLazy"

M.dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
}

M.opts = function()
    return require("configs.telescope_options")
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
    { '<leader>/',       find("current_buffer_fuzzy_find"), desc = "Search" },
    { '<leader><Space>', find("buffers"),                   desc = "Find existing Buffers" },
    { '<leader>fa',      find("autocommands"),              desc = "Autocommands" },
    { "<Leader>fc",      find("commands"),                  desc = "Commands" },
    { '<leader>ff',      find("find_files"),                desc = "Find Files" },
    { '<leader>fg',      find("live_grep"),                 desc = "Live Grep - find string in cwd" },
    { "<leader>fw",      find("grep_string"),               desc = "Search Current Word" },
    { "<leader>fd",      find("diagnostics"),               desc = "Search diagnostics" },
    { "<leader>fr",      find("resume"),                    desc = "Search Resume" },
    { "<leader>fo",      find("oldfiles"),                  desc = "Search recent files ('.' for repeat)" },
    { '<leader>fs',      find("git_status"),                desc = "Show git status" },
    { "<Leader>fh",      find("help_tags"),                 desc = "Help" },
    { "<Leader>fl",      find("loclist"),                   desc = "Location list" },
    { "<Leader>fq",      find("quickfix"),                  desc = "Quickfix list" },
    { "<leader>fk",      find("keymaps"),                   desc = "Search Keymaps" },
}

return M
