return {
	'epwalsh/obsidian.nvim',
	enabled = false,
	version = '*', -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = { 'markdown' },
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		'nvim-lua/plenary.nvim',
	},
	opts = {
		workspaces = {
			{
				name = 'PhyLab',
				path = '~/Documents/PhyLab/',
			},
			-- {
			--     name = "personal",
			--     path = "~/vaults/personal",
			-- },
			-- {
			--     name = "work",
			--     path = "~/vaults/work",
			-- },
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},

		-- Optional, configure additional syntax highlighting / extmarks.
		-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
		ui = {
			enable = false, -- set to false to disable all additional syntax features
		},
	},

	config = function(_, opts)
		require('obsidian').setup(opts)
	end,
}
