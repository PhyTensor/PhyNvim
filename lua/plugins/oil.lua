-- Extract Oil configuration
require("oil").setup({
    view_options = {
        show_hidden = true
    }
})

local keys = {
    {
        "n",
        "\\",
        "<CMD>Oil<CR>",
        { desc = "Open parent directory" }
    }
}

local utils = require("config.utils")
utils.set_keymaps(keys)
