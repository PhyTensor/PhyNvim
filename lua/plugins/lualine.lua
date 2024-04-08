local lazy_status = require("lazy.status") -- to configure lazy pending updates count

return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
        'linrongbin16/lsp-progress.nvim', -- LSP loading progress
        lazy = true,
    },
},
opts = {
    options = {
        icons_enabled = true,
        -- component_separators = "|",
        -- section_separators = "",
        theme = 'auto', -- 'fluoromachine', -- 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                file_status = true,     -- displays file status (readonly status, modified status)
                newfile_status = false, -- displays new file status (new file means no write after create)

                path = 4,               -- 0: just the filename
                --                          -- 1: relative path
                --                          -- 2: absolute path
                --                          -- 3: absolute path, with tilde as home directory
                --                          -- 4: filename and parent dir, with tilde as home dir

                symbols = {
                    modified = '[+]', -- text to show when file is modified
                    readonly = '[-]', -- text to show when file is non-modifiable or readonly
                }
            }
        },
        lualine_x = {
            {
                lazy_status.updates,
                cond = lazy_status.has_updates,
                color = { fg = "#ff9e64" },
            },
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
},
}
