local M = { "maxmx03/fluoromachine.nvim" }

M.config = function()
    local fm = require('fluoromachine')

    fm.setup {
        glow = true,
        theme = 'fluoromachine',-- 'delta',-- 'retrowave',-- 'fluoromachine'
        transparent = false, -- 'full',-- true,
    }

    -- vim.cmd.colorscheme('fluoromachine')
end

return M
