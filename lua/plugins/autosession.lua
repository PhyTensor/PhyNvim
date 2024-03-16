local M = { "rmagatti/auto-session" }

M.enabled = false

M.lazy = true

M.opts = {
    log_level = "error",
    auto_restore_enabled = true,
    auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
}

M.config = function(_, opts)
    local auto_session = require("auto-session")

    auto_session.setup(opts)
end

return M
