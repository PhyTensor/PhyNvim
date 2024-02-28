local M = { "folke/which-key.nvim" }

M.enabled = true

M.lazy = true

M.event = { 'BufReadPre', 'BufNewFile' }

function M.config()
    require("which-key")

    local mappings = {
        ["<Leader>"] = {
            ["?"] = { "<Cmd>WhichKey<CR>", "Keys" },
            e = { name = "explore" },
            f = { name = "find" },
        },
    }

    require("which-key").register(mappings)
end

return M
