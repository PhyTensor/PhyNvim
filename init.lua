-- Core Configuration
require('config.globals')
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugin Management
require('plugins')

-- Extract LSP enabling
vim.lsp.enable({
	"lua_ls",
	"pylsp",
	"godot",
	"omnisharp",
})

-- Extract colorscheme setup
vim.cmd.colorscheme("catppuccin-mocha")

-- Extract Diagnostics
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	underline = {
		severity = vim.diagnostic.severity.ERROR,
	},
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded", -- "rounded", -- "single",
		source = true, -- "if_many", -- true
		header = "Diagnostics",
		prefix = " ● ",
	},
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 4,
		prefix = " ● ",
		update_in_insert = false,
		severity_sort = true,
		format = function(diagnostic)
			-- Add a custom format function to show error codes
			-- local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
			-- return string.format('%s %s', code, diagnostic.message)

			local diagnostic_message = {
				-- [vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
	virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
		current_line = false,
		source = "if_many",
		spacing = 4,
		prefix = " ● ",
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				-- [vim.diagnostic.severity.WARN] = diagnostic.message,
				-- [vim.diagnostic.severity.INFO] = diagnostic.message,
				-- [vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
