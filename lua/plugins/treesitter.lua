-- Highlight, edit, and navigate code
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	enabled = true,
	opts = {
		ensure_installed = {
			"bash",
			"http",
			"c",
			"diff",
			"html",
			"lua",
			"python",
			"c_sharp",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"html",
			"css",
			"godot",
			"gdscript",
			"godot_resource",
			"gdshader",
			"yaml",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			-- additional_vim_regex_highlighting = { 'ruby' },
			additional_vim_regex_highlighting = false,
		},
		-- indent = {
		-- 	enable = false,
		-- 	disable = {},
		-- },
		-- rainbow = {
		-- 	enable = true,
		-- 	extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		-- 	max_file_lines = nil, -- if 1000, Do not enable for files with more than 1000 lines, int
		-- },
	},
}
