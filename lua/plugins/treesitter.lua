require("nvim-treesitter").setup({
	ensure_installed = {
		"bash",
		"http",
		"c",
		"kotlin",
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
		"json",
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
	indent = {
		enable = true,
		-- disable = {},
	},
	-- rainbow = {
	-- 	enable = true,
	-- 	extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
	-- 	max_file_lines = nil, -- if 1000, Do not enable for files with more than 1000 lines, int
	-- },
})

-- When upgrading the plugin, one must ensure all installed parsers are updated to the latest version via :TSUpdate
vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
  callback = function(event)
    if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
      vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, 'TSUpdate')
      if ok then
        vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
      else
        vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
      end
    end
  end,
})

