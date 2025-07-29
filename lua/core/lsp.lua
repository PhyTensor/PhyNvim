-- -----------------------------------------------------------------------------
-- Enable Configured LSP Servers
-- -----------------------------------------------------------------------------
vim.lsp.enable(require("core.servers"))

-- -----------------------------------------------------------------------------
-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
-- -----------------------------------------------------------------------------
vim.hl.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- -----------------------------------------------------------------------------
-- Diagnostics
-- -----------------------------------------------------------------------------
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

-- vim.cmd([[set completeopt+=menuone,noselect,popup]])

-- -----------------------------------------------------------------------------
-- LSP Keymaps and Autocommands
-- -----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		-- A function for easily defining mappings specific to LSP related items
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- grr - References
		map("grr", function()
			vim.lsp.buf.references()
		end, "References")

		--gri - Implementation
		map("gri", function()
			vim.lsp.buf.implementation()
		end, "Implementation")

		-- grn - Rename
		map("grn", function()
			vim.lsp.buf.rename()
		end, "Rename")

		-- gra - Code Action
		map("gra", function()
			vim.lsp.buf.code_action()
		end, "Code Action")

		-- grt - Type Definition
		map("grt", function()
			vim.lsp.buf.type_definition()
		end, "Type Definition")

		map("grs", function()
			vim.lsp.buf.workspace_symbol()
		end, "Workspace Symbol")

		-- gd - Goto Definition
		map("gd", function()
			vim.lsp.buf.definition()
		end, "[G]oto [D]efinition")

		-- gD - Goto Declaration
		map("gD", function()
			vim.lsp.buf.declaration()
		end, "[G]oto [D]eclaration")

		-- gO - Document Symbol
		map("gO", function()
			vim.lsp.buf.document_symbol()
		end, "Document Symbol")

		-- gS - Signature Help
		map("gS", function()
			vim.lsp.buf.signature_help()
		end, "Signature Help")

		-- K - However Documentation
		map("K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, "Hover Documentation")

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		-- vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })

		-- Built-in Autocompletion
		-- if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
		-- 	-- if client:supports_method("textDocument/completion") then
		-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
		-- 	-- vim.keymap.set("i", "<Tab>", function()
		-- 	-- 	vim.lsp.completion.get()
		-- 	-- end)
		-- end

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("phynvim-lsp-highlight", { clear = false })

			-- highlight references of the word under the cursor when the cursor rests there for a little while
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			-- Display Floating diagnostics message
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				callback = function()
					vim.diagnostic.open_float(nil, { focusable = false, source = true })
				end,
			})

			-- clear the highlights when the cursor moves
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			-- clear highlights when the buffer is closed/LSP is detached
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("phynvim-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "phynvim-lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		-- This may be unwanted, since they displace some of your code
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})
