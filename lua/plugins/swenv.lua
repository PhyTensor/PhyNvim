-- Tiny plugin to quickly switch python virtual environments from within neovim without restarting.
return {
    'AckslD/swenv.nvim',
    enabled = true,
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    opts = {},
    config = function(_, opts)
        require('swenv').setup(opts)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python" },
            callback = function()
                require('swenv.api').auto_venv()
            end
        })
    end,
}
