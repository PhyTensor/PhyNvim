require('diffview').setup()

local keys = {
    { "n", "<leader>dv", function() require("diffview").open() end, { desc = "Open diffview" } },
    { "n", "<leader>dc", function() require("diffview").close() end, { desc = "Close diffview" } }
}

local utils = require("config.utils")
utils.set_keymaps(keys)
