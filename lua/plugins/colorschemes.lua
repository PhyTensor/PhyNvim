return {
	{
		"cpwrs/americano.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
		opts = {
			terminal = true, -- Set terminal colors
			overrides = {}, -- Override americano highlight groups
		},
		config = function(_, opts)
			require("americano").setup(opts)
		end,
	},
	{
		"kvrohit/substrata.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
		config = function()
			require("vscode").setup()
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = true,
		enabled = true,
		priority = 1000,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
	},
	{
		"neanias/everforest-nvim",
		-- version = false,
		lazy = true,
		enabled = true,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
		end,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = true, -- make sure we load this during startup if it is your main colorscheme
		enabled = true,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("night-owl").setup()
			vim.cmd.colorscheme("night-owl")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = true,
		enabled = true,
		priority = 1000,
		name = "rose-pine",
		opts = {
			variant = "moon", -- "auto", -- auto, main, moon, or dawn
			dark_variant = "main", -- "main", -- main, moon, or dawn
			dim_inactive_windows = true,
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	{
		"ntk148v/habamax.nvim",
		enabled = true,
		lazy = true,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
	},
	{
		"nobbmaestro/nvim-andromeda",
		lazy = true,
		priority = 1000,
		dependencies = {
			{ "tjdevries/colorbuddy.nvim", branch = "dev" },
		},
		opts = {
			preset = "andromeda",
			transparent_bg = false,
		},
		config = function(_, opts)
			require("andromeda").setup(opts)
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		lazy = true,
		priority = 1000,
		opts = {
			transparent = false,
			italic_comments = true,
			hide_fillchars = true,
			borderless_telescope = true,
		},
		config = function(_, opts)
			require("cyberdream").setup(opts)
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		enabled = true,
		lazy = true,
		priority = 1000,
		opts = {
			transparent_bg = false,
		},
	},
	{
		"maxmx03/fluoromachine.nvim",
		enabled = true,
		lazy = true, -- load immediately when starting neovim
		priority = 1000, -- load the colorscheme before other non-lazy-loaded plugins
		opts = {
			glow = false,
			theme = "fluoromachine", -- 'delta',-- 'retrowave',-- 'fluoromachine'
			transparent = false, -- 'full',-- true,
		},
		config = function(_, opts)
			require("fluoromachine").setup(opts)
			vim.cmd.colorscheme("fluoromachine")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
		opts = {
			undercurl = true,
			keywordStyle = { italic = true },
			statstatementStyle = { bold = true },
			transparent = false,
			terminalColors = true,
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "wave", -- Load "wave" theme when 'background' option is not set
			background = { -- map the value of 'background' option to a theme
				dark = "wave", -- try "dragon" !
				light = "lotus",
			},
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			vim.g.zenbones_darken_comments = 45
			vim.cmd.colorscheme("zenbones")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		enabled = true,
		priority = 1000,
		opts = {
			options = {
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		},
		config = function(_, opts)
			require("nightfox").setup(opts)
		end,
	},
	{
		"nobbmaestro/nvim-andromeda",
		lazy = true,
		priority = 1000,
		dependencies = {
			{ "tjdevries/colorbuddy.nvim", branch = "dev" },
		},
		opts = {
			preset = "andromeda",
			transparent_bg = false,
		},
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = true, -- Show/hide background
			ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
			-- Plugins Config --
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		},
	},
	{
		"sainnhe/sonokai",
		lazy = true,
		priority = 1000,
		config = function()
			vim.g.sonokai_transparent_background = "0"
			vim.g.sonkai_enable_italic = "1"
			vim.g.sonokai_style = "andromeda"
			-- vim.cmd.colorscheme("sonokai")
			vim.g.sonokai_cursor = "red"
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = true,
		lazy = true,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			style = "night",
		},
	},
}
