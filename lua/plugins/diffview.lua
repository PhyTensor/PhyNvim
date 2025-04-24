-- Single tabpage interface for easily cycling through diffs for all modified files
-- for any git rev.
-- Vim's diff mode is pretty good, but there is no convenient way to quickly bring
-- up all modified files in a diffsplit. This plugin aims to provide a simple,
-- unified, single tabpage interface that lets you easily review all changed files
-- for any git rev.

return {
	'sindrets/diffview.nvim',
	enabled = true,
	lazy = true,
	event = { 'BufReadPre' },
	opts = {},
	config = function(_, opts)
		require('diffview').setup(opts)
	end,
}
