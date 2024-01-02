local M = { "windwp/nvim-autopairs" }

M.event = "InsertEnter"

M.dependencies = {
    "hrsh7th/nvim-cmp"
}

M.opts = {
    check_ts = true, -- enable treesitter
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" }
}

M.config = function(_, opts)
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    autopairs.setup(opts)

    -- setup cmp for autopairs. Import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
