return {
    'itmecho/neoterm.nvim',
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        clear_on_run = true, -- Run clear command before user specified commands
        position = 'right',  -- Position of the terminal window: fullscreen (0), top (1), right (2), bottom (3), left (4), center (5) (string or integer value)
        noinsert = false,    -- Disable entering insert mode when opening the neoterm window
        width = 0.45,        -- Width of the terminal window (percentage, ratio, or range between 0-1)
        height = 1,
    },
    config = function(_, opts)
        require('neoterm').setup(opts)
    end,
}
