-- Extract Blink.cmp configuration
--
-- @module 'blink.cmp'
-- @type blink.cmp.Config
require("blink.cmp").setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = "super-tab",
		["<C-Tab>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "accept_and_enter", "fallback" },
		["C-y"] = { "select_and_accept" },

		["<Tab>"] = {
			-- function(cmp)
			--         if cmp.snippet_active() then
			--             return cmp.accept()
			--         else
			--             return cmp.select_and_accept()
			--         end
			-- end,
			"select_next",
			-- 'snippet_forward',
			"fallback",
		},
		["<S-Tab>"] = {
			"select_prev",
			-- 'snippet_backward',
			"fallback",
		},

		["<C-p>"] = {
			-- 'select_prev',
			"snippet_backward",
			"fallback_to_mappings",
		},
		["<C-n>"] = {
			-- 'select_next',
			"snippet_forward",
			"fallback_to_mappings",
		},

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},

	signature = { enabled = true },

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- Enable cmdline
	cmdline = {
		enabled = true,
		completion = { menu = { auto_show = true } },
		keymap = {
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	completion = {
		accept = {
			-- experimental auto-brackets support
			auto_brackets = {
				enabled = true,
			},
		},
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
		menu = {
			auto_show = true,
			scrollbar = false,
			border = "rounded",
			draw = {
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" }, { "source_name" } },
			},
		},
		ghost_text = {
			enabled = true,
		},
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = {
			"supermaven",
			"lsp",
			"snippets",
			"buffer",
			"path",
			"cmdline",
		},
		providers = {
			supermaven = {
				module = "blink.compat.source",
				name = "supermaven",
				score_offset = 100,
				async = true,
			},
			cmdline = {
				min_keyword_length = 2,
			},
		},
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})


-- vim.api.nvim_create_autocmd('PackChanged', {
--   desc = 'Handle nvim-treesitter updates',
--   group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
--   callback = function(event)
--     if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
--       vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
--       ---@diagnostic disable-next-line: param-type-mismatch
--       local ok = pcall(vim.cmd, 'TSUpdate')
--       if ok then
--         vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
--       else
--         vim.notify('TSUpdate command not available yet, skipping', vim.log.levels.WARN)
--       end
--     end
--   end,
-- })

