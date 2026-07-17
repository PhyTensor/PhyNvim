local job_indicator = { require("easy-dotnet.ui-modules.jobs").lualine }

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = {}, winbar = {} },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
	},
	sections = {
		lualine_a = {
			{ "mode", right_padding = 2 },
			job_indicator,
		},
		lualine_b = {
			"branch",
			"diff",
			{
				"diagnostics",
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 4,
				symbols = {
					modified = "",
					readonly = "",
					unnamed = "",
				},
			},
		},
		lualine_x = {
			{
				function()
					local msg = ""
					local recording_register = vim.fn.reg_recording()
					if recording_register ~= "" then
						msg = " Recording @" .. recording_register
					end
					return msg
				end,
				color = { fg = "#ff9e64" },
			},
			{
				function()
					local clients = vim.lsp.get_clients()
					if next(clients) == nil then
						return ""
					end
					local client_names = {}
					for _, client in pairs(clients) do
						table.insert(client_names, client.name)
					end
					return " " .. table.concat(client_names, ", ")
				end,
				color = { fg = "#56b6c2" },
			},
			{
				function()
					local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
					if venv and venv ~= "" then
						return " " .. vim.fn.fnamemodify(venv, ":t")
					end
					return ""
				end,
				color = { fg = "#98c379" },
			},
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = {
			"progress",
			function()
				local words = vim.fn.wordcount()["words"]
				return "📖 " .. words
			end,
		},
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { { "location", padding = 0 } },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "quickfix", "nvim-tree" },
})
