return {
	'NvChad/nvim-colorizer.lua',
	enabled = true,
	lazy = true,
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {},
	config = function(_, opts)
		require('colorizer').setup(opts)
	end,
}
