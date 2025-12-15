require('snacks').setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    bufdelete = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    lazygit = { enabled = true },
    gh = {
        enabled = true,
    },
    picker = {
        enabled = true,
        sources = {
            gh_issue = {
                -- your gh_issue picker configuration comes here
                -- or leave it empty to use the default settings
            },
            gh_pr = {
                -- your gh_pr picker configuration comes here
                -- or leave it empty to use the default settings
            }
        }
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
    { "<leader>gg", function() Snacks.lazygit() end,                          desc = "Lazygit" },
    -- Git
    { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
    { "<leader>gb", function() Snacks.picker.git_branches() end,              desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,                   desc = "Git Log" },
    -- File Explorer
    { "<leader>e",  function() Snacks.explorer() end,                         desc = "File Explorer" },
    -- Other
    { "<leader>z",  function() Snacks.zen() end,                              desc = "Toggle Zen Mode" },
    { "<leader>qn", function() Snacks.notifier.hide() end,                    desc = "Dismiss All Notifications" },
    { "<C-t>",      function() Snacks.terminal() end,                         desc = "Toggle Terminal" },
}

for _, m in ipairs(keys) do
    local mode, lhs, rhs, opts
    if #m >= 4 then
        mode, lhs, rhs, opts = m[1], m[2], m[3], m[4]
    else
        mode, lhs, rhs, opts = "n", m[1], m[2], m[3]
    end
    vim.keymap.set(mode, lhs, rhs, opts or {})
end
