return {
	"ibhagwan/fzf-lua",
	enabled = true,
	lazy = true,
	event = {
		"BufWritePre",
		"BufReadPre",
		"BufNewFile",
	},
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {
		defaults = {
			git_icons = true,
			file_icons = false,
			color_icons = true,
		},
		keymap = {
			fzf = {
				true,
				["ctrl-u"] = "preview-page-up",
				["ctrl-d"] = "preview-page-down",
				["ctrl-p"] = "up",
				["ctrl-n"] = "down",
				["ctrl-q"] = "abort",
				["ctrl-f"] = "half-page-down",
				["ctrl-b"] = "half-page-up",
			},
		},
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			{ desc = "[F]ind [F]iles" },
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			{ desc = "[F]ind [G]rep" },
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			{ desc = "[F]ind [B]uffers" },
		},
		{
			"<leader>Space",
			function()
				require("fzf-lua").buffers()
			end,
			{ desc = "[F]ind [B]uffers" },
		},
	},
}

-- return {
-- 	'ibhagwan/fzf-lua',
-- 	dependencies = {
-- 		'nvim-tree/nvim-web-devicons',
-- 	},
-- 	config = function()
-- 		local fzf = require 'fzf-lua'
--
-- 		fzf.setup {
-- 			{
-- 				'fzf-native',
-- 				winopts = {
-- 					preview = { default = 'bat' },
-- 				},
-- 			},
-- 			keymap = {
-- 				fzf = {
-- 					true,
-- 					['h'] = 'abort',
-- 					['ctrl-u'] = 'preview-page-up',
-- 					['ctrl-d'] = 'preview-page-down',
-- 					['ctrl-p'] = 'up',
-- 					['ctrl-n'] = 'down',
-- 					['ctrl-f'] = 'half-page-down',
-- 					['ctrl-b'] = 'half-page-up',
-- 				},
-- 				-- fzf = {
-- 				-- 	true,
-- 				-- 	['ctrl-f'] = 'half-page-down',
-- 				-- 	['ctrl-b'] = 'half-page-up',
-- 				-- 	['h'] = 'abort',
-- 				-- 	['ctrl-n'] = 'down',
-- 				-- 	['ctrl-p'] = 'up',
-- 				-- 	['l'] = 'accept',
-- 				-- 	-- ['i'] = 'unbind(h)+unbind(j)+unbind(k)+unbind(l)+unbind(i)',
-- 				-- 	-- ['esc'] = 'rebind(h)+rebind(j)+rebind(k)+rebind(l)+rebind(i)',
-- 				-- 	-- ['i'] = 'unbind(h)+unbind(j)+unbind(k)+unbind(l)+unbind(i)+change-prompt(> )',
-- 				-- 	-- ['esc'] = 'transform:case "$FZF_PROMPT" in\n'
-- 				-- 	-- 	.. '*NORMAL*) echo abort;;\n'
-- 				-- 	-- 	.. "*) echo \"change-prompt(NORMAL - PRESS 'I' FOR INSERT MODE)"
-- 				-- 	-- 	.. '+rebind(h)+rebind(j)+rebind(k)+rebind(l)+rebind(i)";;'
-- 				-- 	-- 	.. '\nesac',
-- 				-- 	-- ['start'] = "change-prompt(NORMAL - PRESS 'I' FOR INSERT MODE)",
-- 				-- },
-- 			},
-- 			files = {
-- 				fd_opts = '--type f --hidden --exclude node_modules --exclude .git --exclude .venv',
-- 				previewer = 'bat',
-- 			},
-- 			buffers = {
-- 				sort_lastused = true,
-- 				previewer = 'bat',
-- 			},
-- 			grep = {
-- 				cmd = 'rg --line-number --column --no-heading --color=always --smart-case',
-- 				rg_opts = '--hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.venv/*"',
-- 				previewer = 'bat',
-- 			},
-- 			live_grep = {
-- 				cmd = 'rg --line-number --column --no-heading --color=always --smart-case',
-- 				rg_opts = '--hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.venv/*"',
-- 				previewer = 'bat',
-- 			},
-- 			git = {
-- 				files = {
-- 					previewer = 'bat',
-- 				},
-- 			},
-- 			fzf_opts = {
-- 				['--tiebreak'] = 'index',
-- 			},
-- 			defaults = {
-- 				git_icons = true,
-- 				file_icons = true,
-- 				color_icons = true,
-- 			},
-- 		}
--
-- 		local keymap = vim.keymap.set
--
-- 		keymap('n', '<leader>fb', fzf.buffers, { desc = '[S]earch existing [B]uffers' })
-- 		keymap('n', '<leader>fm', fzf.marks, { desc = '[S]earch [M]arks' })
-- 		keymap('n', '<leader>gf', fzf.git_files, { desc = 'Search [G]it [F]iles' })
-- 		keymap('n', '<leader>gc', fzf.git_commits, { desc = 'Search [G]it [C]ommits' })
-- 		keymap('n', '<leader>gcf', fzf.git_bcommits, { desc = 'Search [G]it [C]ommits for current [F]ile' })
-- 		keymap('n', '<leader>tgb', fzf.git_branches, { desc = 'Search [G]it [B]ranches' })
-- 		keymap('n', '<leader>gs', fzf.git_status, { desc = 'Search [G]it [S]tatus (diff view)' })
-- 		keymap('n', '<leader>ff', fzf.files, { desc = '[S]earch [F]iles' })
-- 		keymap('n', '<leader>sh', fzf.help_tags, { desc = '[S]earch [H]elp' })
-- 		keymap('n', '<leader>scw', fzf.grep_cword, { desc = '[S]earch current [W]ord' })
-- 		keymap('n', '<leader>lg', fzf.live_grep, { desc = '[S]earch by [G]rep' })
-- 		keymap('n', '<leader>fd', fzf.diagnostics_document, { desc = '[S]earch [D]iagnostics' })
-- 		keymap('n', '<leader>fr', fzf.resume, { desc = '[S]earch [R]esume' })
-- 		keymap('n', '<leader>fo', fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
-- 		keymap('n', '<leader>qf', fzf.quickfix, { desc = 'Show quick fix list' })
-- 		keymap('n', '<leader>ft', function()
-- 			fzf.grep { cmd = 'rg --column --line-number', search = 'TODO', prompt = 'Todos> ' }
-- 		end, { desc = 'Find todos' })
-- 		keymap('n', '<leader>a', function()
-- 			fzf.lsp_document_symbols {
-- 				symbol_types = { 'Class', 'Function', 'Method', 'Constructor', 'Interface', 'Module', 'Property' },
-- 			}
-- 		end, { desc = '[S]each LSP document [S]ymbols' })
-- 		keymap('n', '<leader><leader>', fzf.buffers, { desc = 'Find existing buffers' })
-- 		keymap('n', '<leader>s/', function()
-- 			fzf.live_grep { buffers_only = true, prompt = 'Live Grep in Open Files> ' }
-- 		end, { desc = '[S]earch [/] in Open Files' })
-- 		keymap('n', '<leader>/', function()
-- 			fzf.blines { previewer = false }
-- 		end, { desc = 'Fuzzily search in current buffer' })
-- 	end,
-- }
