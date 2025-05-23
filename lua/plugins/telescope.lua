-- Fuzzy Finder (files, lsp, etc)
return {
	'nvim-telescope/telescope.nvim',
	-- branch = '0.1.x',
	enabled = true,
	lazy = true,
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-frecency.nvim',
		'BurntSushi/ripgrep',
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			'nvim-telescope/telescope-fzf-native.nvim',

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = 'make',

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},
	opts = {
		-- You can put your default mappings / updates / etc. in here
		--  All the info you're looking for is in `:help telescope.setup()`
		--
		defaults = {
			vimgrep_arguments = {
				'rg',
				'-L',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
			},
			prompt_prefix = '   ',
			selection_caret = '  ',
			entry_prefix = '  ',
			initial_mode = 'insert',
			selection_strategy = 'reset',
			sorting_strategy = 'ascending',
			layout_strategy = 'horizontal',
			layout_config = {
				vertical = {
					mirror = false,
				},
				horizontal = {
					prompt_position = 'top',
				},
				preview_cutoff = 120,
			},
			file_ignore_patterns = {
				'node_modules',
				'vendor/*',
				'%.lock',
				'__pycache__/*',
				'%.sqlite3',
				'%.ipynb',
				'node_modules/*',
				'%.jpg',
				'%.jpeg',
				'%.png',
				'%.svg',
				'%.otf',
				'%.ttf',
				'.git/',
				'%.webp',
				'.dart_tool/',
				'.github/',
				'.gradle/',
				'.idea/',
				'.settings/',
				'.vscode/',
				'__pycache__/',
				'build/',
				'env/',
				'gradle/',
				'node_modules/',
				'target/',
				'%.pdb',
				'%.dll',
				'%.class',
				'%.exe',
				'%.cache',
				'%.ico',
				'%.pdf',
				'%.dylib',
				'%.jar',
				'%.docx',
				'%.met',
				'smalljre_*/*',
				'.vale/',
				'%.burp',
				'%.mp4',
				'%.mkv',
				'%.rar',
				'%.zip',
				'%.7z',
				'%.tar',
				'%.bz2',
				'%.epub',
				'%.flac',
				'%.tar.gz',
			},
			file_sorter = require('telescope.sorters').get_fuzzy_file,
			generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
			path_display = { 'truncate' },
			file_previewer = require('telescope.previewers').vim_buffer_cat.new,
			grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
			qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
			-- Developer configurations: Not meant for general override
			buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
			mappings = {
				n = { ['q'] = require('telescope.actions').close },
				i = {
					['<c-enter>'] = 'to_fuzzy_refine',
					['<C-k>'] = require('telescope.actions').move_selection_previous, -- move to prev result
					['<C-j>'] = require('telescope.actions').move_selection_next, -- move to next result
					['<C-q>'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
				},
			},
		},
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
		},
		extensions_list = {
			'fzf',
			'noice',
			'ui-select', -- sets vim.ui.select to telescope
			'zoxide',
			'dap',
			'frecency',
		}, --{ "themes", "terms", "fzf" },
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = 'smart_case',
			},
			['ui-select'] = {
				require('telescope.themes').get_dropdown(),
			},
		},
	},
	config = function(_, opts)
		local telescope = require 'telescope'
		telescope.setup(opts)

		-- Enable Telescope extensions if they are installed
		-- pcall(telescope.load_extension, 'fzf')
		-- pcall(telescope.load_extension, 'ui-select')
		-- load extensions
		for _, ext in ipairs(opts.extensions_list) do
			pcall(telescope.load_extension, ext)
			-- telescope.load_extension(ext)
		end

		-- See `:help telescope.builtin`
		local builtin = require 'telescope.builtin'

		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
		vim.keymap.set('n', '<leader>sb', '<Cmd> Telescope diagnostics bufnr=0 <CR>', { desc = '[S]earch [B]uffer Diagnostics' })
		vim.keymap.set('n', '<leader>sl', '<Cmd>lua vim.diagnostic.open_float()<CR>', { desc = '[S]how [L]ine Diagnostic' })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
		vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set('n', '<leader>/', function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[/] Fuzzily search in current buffer' })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set('n', '<leader>s/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = '[S]earch [/] in Open Files' })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set('n', '<leader>sn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[S]earch [N]eovim files' })
	end,
}
