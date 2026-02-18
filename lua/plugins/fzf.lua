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
    { "n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "[F]ind [F]iles" } },
    { "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "[F]ind [G]rep" } },
    { "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "[F]ind [B]uffers" } },
    { "<leader><leader>", function() require("fzf-lua").buffers() end, { desc = "[F]ind [B]uffers" } },
    { "<leader>lf", function() require("fzf-lua").quickfix() end, { desc = "Show quick fix list" } },
}

utils.set_keymaps(keys)

-- Lazy-load FZF setup
vim.defer_fn(function()
    require("fzf-lua").setup(options)
end, 0)
