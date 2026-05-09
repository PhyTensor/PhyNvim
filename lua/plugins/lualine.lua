local job_indicator = { require("easy-dotnet.ui-modules.jobs").lualine }

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = {}, winbar = {} },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
	},
	sections = {
		lualine_a = {
            "mode",
            job_indicator,
        },
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				newfile_status = true, -- displays new file status (new file means no write after create)

				path = 4, -- 0: just the filename
				-- 1: relative path
				-- 2: absolute path
				-- 3: absolute path, with tilde as home directory
				-- 4: filename and parent dir, with tilde as home dir

				symbols = {
					modified = "", -- text to show when file is modified
					readonly = "", -- text to show when file is non-modifiable or readonly
					unnamed = "",
				},
			},
		},
		lualine_x = {
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
					return "" .. table.concat(client_names, ", ")
				end,
				icon = " ",
				color = { fg = "#56b6c2" },
			},
			{
				function()
					local venv = os.getenv("VIRTUAL_ENV") or
					os.getenv("CONDA_DEFAULT_ENV")        -- or "NO ENV"
					if venv ~= "" then
						-- return "" .. venv
						return os.getenv("VIRTUAL_ENV") and "" .. vim.fn.fnamemodify(venv, ":t") or
						""
					end
				end,
				icon = "",
				color = { fg = "#98c379" },
			},
			-- {
			-- 	lazy_status.updates,
			-- 	cond = lazy_status.has_updates,
			-- 	-- require("noice").api.statusline.mode.get,
			-- 	-- cond = require("noice").api.statusline.mode.has,
			-- 	color = { fg = "#ff9e64" },
			-- },
			-- {
			--     require("noice").api.status.command.get,
			--     cond = require("noice").api.status.command.has,
			--     color = { fg = "#ff9e64" },
			-- },
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = {
			"progress",
			function()
				-- display word count
				local ft = vim.bo.filetype -- get filetype
				local words = vim.fn.wordcount()["words"]
				return "📖 " .. words
			end,
			function()
				-- display file size
				local size = vim.fn.getfsize(vim.fn.expand("%"))
				if size < 0 then
					return ""
				end
				if size < 1024 then
					return size .. "B"
				elseif size < 1024 * 1024 then
					return string.format("%.1fK", size / 1024)
				else
					return string.format("%.1fM", size / 1024 / 1024)
				end
			end,
		},
		lualine_z = {
			"location",
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
	tabline = {
		-- lualine_a = { 'buffers' },
	},
	winbar = {},
	inactive_winbar = {},
	extensions = { "quickfix", "nvim-tree" },
})
