-- local highlight = {
-- 	-- "CursorColumn",
-- 	'Whitespace',
-- }

return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    enabled = true,
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    -- opts = {
    -- 	exclude = { filetypes = { 'dashboard' } },
    -- 	indent = {
    -- 		highlight = highlight,
    -- 		-- char = "│",
    -- 		char = '┊',
    -- 	},
    -- 	whitespace = {
    -- 		highlight = highlight,
    -- 		remove_blankline_trail = false,
    -- 	},
    -- },
    -- config = function(_, opts)
    -- 	require('ibl').setup(opts)
    -- end,
}
