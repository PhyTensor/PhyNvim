local utils = require("config.utils")

require('snacks').setup({
    bigfile = { enabled = true },
    bufdelete = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    lazygit = { enabled = true },
    gh = { enabled = true },
    picker = {
        enabled = true,
        sources = {
            gh_issue = {},
            gh_pr = {},
        },
    },
    notifier = { enabled = true, timeout = 3000 },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
})

local keys = {
    -- Lazygit
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- Git
    { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    -- File Explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- Other
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>qn", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<C-t>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
}

utils.set_keymaps(keys)
