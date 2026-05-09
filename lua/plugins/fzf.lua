local utils = require("config.utils")

local options = {
    fzf_colors = true,
    defaults = {
        git_icons = true,
        file_icons = true,
        color_icons = true,
        formatter = "path.dirname_first",
    },
    keymap = {
        fzf = {
            true,
            ["ctrl-u"] = "preview-page-up",
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-p"] = "up",
            ["ctrl-n"] = "down",
            ["ctrl-q"] = "select-all+accept",
            ["ctrl-f"] = "half-page-down",
            ["ctrl-b"] = "half-page-up",
        },
    },
}

local keys = {
    { "<leader>ff", function() require("fzf-lua").files() end,                 { desc = "[F]ind [F]iles" } },
    { "<leader>fg", function() require("fzf-lua").live_grep() end,             { desc = "[F]ind [G]rep" } },
    { "<leader>fb", function() require("fzf-lua").buffers() end,               { desc = "[F]ind [B]uffers" } },
    { "<leader>lf", function() require("fzf-lua").quickfix() end,              { desc = "Show quick fix list" } },
    { "<leader>fh", function() require("fzf-lua").help_tags() end,             { desc = "Help Tags" } },
    { "<leader>fx", function() require("fzf-lua").diagnostics_document() end,  { desc = "Diagnostics Document" } },
    { "<leader>fX", function() require("fzf-lua").diagnostics_workspace() end, { desc = "Diagnostics Workspace" } }
}

utils.set_keymaps(keys)

-- Lazy-load FZF setup
vim.defer_fn(function()
    require("fzf-lua").setup(options)
end, 0)
