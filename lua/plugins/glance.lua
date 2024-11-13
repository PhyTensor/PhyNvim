-- A pretty window for previewing, navigating and editing your LSP locations
return {
    "dnlhc/glance.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        require('glance').setup(opts)
    end,
}

-- Lua
-- vim.keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
-- vim.keymap.set('n', 'gR', '<CMD>Glance references<CR>')
-- vim.keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
-- vim.keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')
