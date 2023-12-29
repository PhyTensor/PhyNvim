local M = { "maxmx03/fluoromachine.nvim" }

M.enabled = false

M.lazy = true     -- load immediately when starting neovim

M.priority = 1000 -- load the colorscheme before other non-lazy-loaded plugins

M.config = function()
    local fm = require('fluoromachine')

    fm.setup {
        glow = false,
        theme = 'auto',      -- 'fluoromachine', -- 'delta',-- 'retrowave',-- 'fluoromachine'
        transparent = false, -- 'full',-- true,
    }

    -- vim.cmd.colorscheme('fluoromachine')
end

return M
