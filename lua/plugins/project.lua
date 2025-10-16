-- local M = {}

-- function M.init()
-- enable saving the state of plugins in the session
vim.opt.sessionoptions:append("globals")  -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
-- end

-- function M.setup()
require('neovim-project').setup({
	projects = { -- define project roots
		-- "~/Documents/*/*/*",
		"~/Documents/*/*",
		"~/.config/*",
		"~/.dotfiles/*/*",
	},
	picker = {
		type = "snacks", -- 'telescope', -- or "fzf-lua"
		-- preview = true, -- show directory structure preview in Telescope
		preview = {
			enabled = true, -- show directory structure in Telescope preview
			git_status = true, -- show branch name, an ahead/behind counter, and the git status of each file/folder
			git_fetch = false, -- fetch from remote, used to display the number of commits ahead/behind, requires git authorization
			show_hidden = true, -- show hidden files/folders
		},
	},
	-- Path to store history and sessions
	datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/
	-- Load the most recent session on startup if not in the project directory
	last_session_on_startup = true,
	-- Dashboard mode prevent session autoload on startup
	dashboard_mode = true,
	-- Overwrite some of Session Manager options
	session_manager_opts = {
		autosave_ignore_dirs = {
			vim.fn.expand("~"), -- don't create a session for $HOME/
			"/tmp",
			"~/Downloads/",
			"~/Desktop/",
		},
		autosave_ignore_filetypes = {
			-- All buffers of these file types will be closed before the session is saved
			"ccc-ui",
			"gitcommit",
			"gitrebase",
			"qf",
			"toggleterm",
		},
	},
})
-- end

local keys = {
	{
		"n",
		"<leader>pp",
		"<CMD>NeovimProjectDiscover default<CR>",
		{ desc = "Find [P]roject based on [P]atterns" },
	},
	{
		"n",
		"<leader>ph",
		"<CMD>NeovimProjectHistory<CR>",
		{ desc = "Select [P]roject based on [H]istory" },
	},
}

for _, m in ipairs(keys) do
	local mode, lhs, rhs, opts
	if #m >= 4 then
		mode, lhs, rhs, opts = m[1], m[2], m[3], m[4]
	else
		mode, lhs, rhs, opts = "n", m[1], m[2], m[3]
	end
	vim.keymap.set(mode, lhs, rhs, opts or {})
end

-- return M
