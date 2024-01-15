local M = { "coffebar/neovim-project" }

M.enabled = true

M.event = "VeryLazy"

-- M.lazy = false

M.priority = 100

M.init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
end

M.dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
}

M.opts = {
    projects = {
        -- define project roots
        "~/Documents/*/*",
        "~/.config/*",
    },
    -- Path to store history and sessions
    datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
    -- Load the most recent session on startup if not in the project directory
    last_session_on_startup = false,
    -- Overwrite some of Session Manager options
    session_manager_opts = {
        autosave_ignore_dirs = {
            vim.fn.expand("~"), -- don't create a session for $HOME/
            "/tmp",
            "~/Downloads/",
            "~/Desktop/",
        },
        autosave_ignore_filetypes = {
            -- All buffers of these file types will be closed before the session is saved
            -- "ccc-ui",
            "gitcommit",
            "gitrebase",
            -- "qf",
            -- "toggleterm",
        },
    },
}

return M
