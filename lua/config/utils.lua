-- Shared utility functions for configuration
local M = {}

--- Set multiple keymaps with a consistent format
--- @param maps table[] Array of keymap definitions
--- Each map can be: { lhs, rhs, opts } or { mode, lhs, rhs, opts }
function M.set_keymaps(maps)
    for _, m in ipairs(maps) do
        local mode, lhs, rhs, opts
        if #m >= 4 then
            mode, lhs, rhs, opts = m[1], m[2], m[3], m[4]
        else
            mode, lhs, rhs, opts = "n", m[1], m[2], m[3]
        end
        vim.keymap.set(mode, lhs, rhs, opts or {})
    end
end

return M
