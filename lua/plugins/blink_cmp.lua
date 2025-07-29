return {
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	enabled = true,
	-- 	opts = {},
	-- 	keys = {},
	-- },
	{
		"saghen/blink.compat",
		version = "*",
		enabled = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		enabled = true,
		-- optional = true,
		-- optional: provides snippets for the snippet source
		dependencies = {
			-- "rafamadriz/friendly-snippets",

			-- sources
			"supermaven-inc/supermaven-nvim",
		},

		-- use a release tag to download pre-built binaries
		-- version = "1.*",
		version = "*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
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

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},

			-- Enable cmdline
			cmdline = {
				enabled = true,
				completion = { menu = { auto_show = true } },
				keymap = {
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					border = "rounded", -- nil
					scrollbar = false,
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind" },
							{ "source_name" },
						},
					},
				},
				ghost_text = {
					enabled = true,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 300,

					window = {
						border = "rounded",
						scrollbar = false,
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
					},
				},
				list = {
					selection = {
						preselect = true,
						-- preselect = function(ctx)
						--     return not require('blink.cmp').snippet_active { direction = 1 }
						-- end,
					},
				},
			},

			signature = {
				enabled = true,
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
		},
		opts_extend = { "sources.default" },
	},
}
