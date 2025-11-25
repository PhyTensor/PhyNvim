-- Extract FZF configuration
local options = {
	defaults = {
		git_icons = true,
		file_icons = true,
		color_icons = true,
	},
	keymap = {
		fzf = {
			true,
			["ctrl-u"] = "preview-page-up",
			["ctrl-d"] = "preview-page-down",
			["ctrl-p"] = "up",
			["ctrl-n"] = "down",
			-- ["ctrl-q"] = "abort",
			["ctrl-q"] = "select-all+accept",
			["ctrl-f"] = "half-page-down",
			["ctrl-b"] = "half-page-up",
		},
	},
}

local keys = {
	{
		"n",
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
		"<leader><leader>",
		function()
			require("fzf-lua").buffers()
		end,
		{ desc = "[F]ind [B]uffers" },
	},
	{
		"<leader>lf",
		function()
			require("fzf-lua").quickfix()
		end,
		{ desc = "Show quick fix list" },
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

require("fzf-lua").setup(options)
