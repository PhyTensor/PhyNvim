return {
    "folke/edgy.nvim",
    enabled = true,
    lazy = true,
    event = "VeryLazy",
    -- init = function()
    -- 	vim.opt.laststatus = 3
    -- 	vim.opt.splitkeep = "screen"
    -- end,
    opts = {
        animate = {
            enabled = true,
            fps = 100, -- frames per second
            cps = 120, -- cells per second
            on_begin = function()
                vim.g.minianimate_disable = true
            end,
            on_end = function()
                vim.g.minianimate_disable = false
            end,
            -- Spinner for pinned views that are loading.
            -- if you have noice.nvim installed, you can use any spinner from it, like:
            -- spinner = require("noice.util.spinners").spinners.circleFull,
            spinner = {
                frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                interval = 80,
            },
        },
        bottom = {
            -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
            {
                ft = "toggleterm",
                size = { height = 0.4 },
                -- exclude floating windows
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
            "Trouble",
            { ft = "qf",            title = "QuickFix" },
            {
                ft = "help",
                size = { height = 20 },
                -- only show help buffers
                filter = function(buf)
                    return vim.bo[buf].buftype == "help"
                end,
            },
            { ft = "spectre_panel", size = { height = 0.4 } },
        },
        left = {
            -- Neo-tree filesystem always takes half the screen height
            {
                title = "Neo-Tree",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                end,
                size = { height = 0.5 },
            },
            {
                title = "Neo-Tree Git",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "git_status"
                end,
                pinned = true,
                open = "Neotree position=right git_status",
            },
            {
                title = "Neo-Tree Buffers",
                ft = "neo-tree",
                filter = function(buf)
                    return vim.b[buf].neo_tree_source == "buffers"
                end,
                pinned = true,
                open = "Neotree position=top buffers",
            },
            -- any other neo-tree windows
            "neo-tree",
        },
    },
    -- opts = {
    -- 	bottom = {
    -- 		-- toggleterm / lazyterm at the bottom with a height of 40% of the screen
    -- 		{
    -- 			ft = "toggleterm",
    -- 			size = { height = 0.2 },
    -- 			-- exclude floating windows
    -- 			filter = function(buf, win)
    -- 				return vim.api.nvim_win_get_config(win).relative == ""
    -- 			end,
    -- 		},
    -- 		-- {
    -- 		-- 	ft = "lazyterm",
    -- 		-- 	title = "LazyTerm",
    -- 		-- 	size = { height = 0.4 },
    -- 		-- 	filter = function(buf)
    -- 		-- 		return not vim.b[buf].lazyterm_cmd
    -- 		-- 	end,
    -- 		-- },
    -- 		{
    -- 			ft = "Trouble",
    -- 			size = { height = 0.4 },
    -- 		},
    -- 		{
    -- 			ft = "qf",
    -- 			title = "QuickFix",
    -- 			size = { height = 0.36 },
    -- 		},
    -- 		{
    -- 			ft = "help",
    -- 			size = { height = 20 },
    -- 			-- only show help buffers
    -- 			filter = function(buf)
    -- 				return vim.bo[buf].buftype == "help"
    -- 			end,
    -- 		},
    -- 		{
    -- 			ft = "spectre_panel",
    -- 			size = { height = 0.4 },
    -- 		},
    -- 	},
    -- 	left = {
    -- 		-- Neo-tree filesystem always takes half the screen height
    -- 		-- {
    -- 		-- 	title = "Neo-Tree",
    -- 		-- 	ft = "neo-tree",
    -- 		-- 	filter = function(buf)
    -- 		-- 		return vim.b[buf].neo_tree_source == "filesystem"
    -- 		-- 	end,
    -- 		-- 	size = { height = 0.5 },
    -- 		-- },
    -- 		-- {
    -- 		-- 	title = "Neo-Tree Git",
    -- 		-- 	ft = "neo-tree",
    -- 		-- 	filter = function(buf)
    -- 		-- 		return vim.b[buf].neo_tree_source == "git_status"
    -- 		-- 	end,
    -- 		-- 	pinned = true,
    -- 		-- 	open = "Neotree position=right git_status",
    -- 		-- },
    -- 		-- {
    -- 		-- 	title = "Neo-Tree Buffers",
    -- 		-- 	ft = "neo-tree",
    -- 		-- 	filter = function(buf)
    -- 		-- 		return vim.b[buf].neo_tree_source == "buffers"
    -- 		-- 	end,
    -- 		-- 	pinned = true,
    -- 		-- 	open = "Neotree position=top buffers",
    -- 		-- },
    -- 		-- {
    -- 		-- 	ft = "Outline",
    -- 		-- 	pinned = true,
    -- 		-- 	open = "SymbolsOutlineOpen",
    -- 		-- },
    -- 	},
    -- },
    config = function(_, opts)
        require("edgy").setup(opts)
    end,
}
