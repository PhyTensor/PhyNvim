local M = { "echasnovski/mini.nvim", version = '*' }

-- function M.align()
--     require("mini.align").setup()
-- end

function M.starter()
    require("mini.starter").setup()
end

function M.completion()
    require("mini.completion").setup()
end

function M.tabline()
    require("mini.tabline").setup()
end

-- function M.comment()
--   require("mini.comment").setup({})
-- end
--
-- function M.pairs()
--   require("mini.pairs").setup({})
-- end

function M.config()
    M.starter()
    M.tabline()
    -- M.align()
    M.completion()
    -- M.comment()
    -- M.pairs()
end

return M
