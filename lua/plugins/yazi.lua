return {
    "mikavilpas/yazi.nvim",
    enabled = true,
    event = "VeryLazy",
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            "<leader>-",
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
        {
            -- Open in the current working directory
            "<leader>cw",
            "<cmd>Yazi cwd<cr>",
            desc = "Open the file manager in nvim's working directory",
        },
        {
            -- NOTE: this requires a version of yazi that includes
            -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
            '<c-up>',
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
        -- Keybindings - Default
        -- <c-v>: open selected files in vertical splits
        -- <c-x>: open selected files in horizontal splits
        -- <c-t>: open selected files in new tabs
        -- <c-q>: open selected files to the quickfix list
    },
    ---@type YaziConfig
    opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = false,
        keymaps = {
            show_help = '<f1>',
        },
    },
}
