return {
    'coffebar/neovim-project',
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        -- optional picker
        { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
        -- optional picker
        { 'ibhagwan/fzf-lua' },
        { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
    opts = {
        projects = { -- define project roots
            '~/Documents/*/*/*',
            '~/Documents/*/*',
            '~/.config/*',
            '~/.dotfiles/*/*',
        },
        picker = {
            type = 'telescope', -- or "fzf-lua"
            preview = true, -- show directory structure preview in Telescope
        },
        -- Path to store history and sessions
        datapath = vim.fn.stdpath 'data', -- ~/.local/share/nvim/
        -- Load the most recent session on startup if not in the project directory
        last_session_on_startup = false,
        -- Overwrite some of Session Manager options
        session_manager_opts = {
            autosave_ignore_dirs = {
                vim.fn.expand '~', -- don't create a session for $HOME/
                '/tmp',
                '~/Downloads/',
                '~/Desktop/',
            },
            autosave_ignore_filetypes = {
                -- All buffers of these file types will be closed before the session is saved
                -- "ccc-ui",
                'gitcommit',
                'gitrebase',
                -- "qf",
                -- "toggleterm",
            },
        },
    },
    config = function(_, opts)
        require('neovim-project').setup(opts)

        vim.keymap.set('n', '<leader>pp', '<CMD>Telescope neovim-project discover<CR>', { desc = 'Find [P]roject based on [P]atterns' })
        vim.keymap.set('n', '<leader>ph', '<CMD>Telescope neovim-project history<CR>', { desc = 'Select [P]roject based on [H]istory' })
    end,
}
