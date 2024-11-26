-- Dooing is a minimalist todo list manager for Neovim, designed with simplicity and efficiency in mind
return {
    "atiladefreitas/dooing",
    enabled = true,
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        -- Core settings
        save_path = vim.fn.stdpath('data') .. '/dooing_todos.json',

        -- Window appearance
        window = {
            width = 40,         -- Width of the floating window
            height = 20,        -- Height of the floating window
            border = 'rounded', -- Border style
        },

        -- Icons
        icons = {
            pending = '○', -- Pending todo icon
            done = '✓', -- Completed todo icon
        },

        -- Keymaps
        keymaps = {
            toggle_window = "<leader>to", -- Toggle the main window
            new_todo = "i",               -- Add a new todo
            toggle_todo = "x",            -- Toggle todo status
            delete_todo = "d",            -- Delete the current todo
            delete_completed = "D",       -- Delete all completed todos
            close_window = "q",           -- Close the window
            toggle_help = "?",            -- Toggle help window
            toggle_tags = "t",            -- Toggle tags window
            clear_filter = "c",           -- Clear active tag filter
        },
    },
    config = function(_, opts)
        require("dooing").setup(opts)
    end,
}
