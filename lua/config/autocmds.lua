-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local function augroup(name)
	return vim.api.nvim_create_augroup("UserConfig_" .. name, { clear = true })
end

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- go to last line when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-create directories when saving
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = augroup("auto-create-directories"),
-- 	pattern = "*",
-- 	callback = function(ctx)
-- 		local dir = vim.fn.expand("<afile>:p:h")
-- 		if vim.fn.isdirectory(dir) == 0 then
-- 			vim.fn.mkdir(dir, "p")
-- 		end
-- 	end,
-- })

-- when opening terminal in neovim
-- Terminal behaviour improvements
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup("custom-neovim_terminal-open"),
	pattern = "*",
	callback = function()
		vim.opt.signcolumn = "no"
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- Removes any trailing whitespace when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "remove trailing whitespace on save",
	group = augroup("remove trailing trailing whitespace"),
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- fix comment on new line
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.cmd([[set formatoptions-=cro]])
-- 	end,
-- })

-- wrap words "softly" (no carriage return) in mail buffer
-- vim.api.nvim_create_autocmd("Filetype", {
-- 	pattern = "mail",
-- 	callback = function()
-- 		vim.opt.textwidth = 0
-- 		vim.opt.wrapmargin = 0
-- 		vim.opt.wrap = true
-- 		vim.opt.linebreak = true
-- 		vim.opt.columns = 80
-- 		vim.opt.colorcolumn = "80"
-- 	end,
-- })

-- Floating diagnostics message
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
	end,
})

-- Built-in Autocompletion
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--
--     -- enable completion when available
--     if client:supports_method 'textDocument/completion' then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

-- Show Diagnostic virtual text
-- vim.diagnostic.config({ virtual_text = true })
-- Show diagnostic virtual text only at current cursor line
-- vim.diagnostic.config({ virtual_text = { current_line = true })
-- Show Diagnostic virtual lines
-- vim.diagnostic.config { virtual_lines = true }
-- Show diagnostic virtual lines and text only at current cursor line
-- vim.diagnostic.config({ virtual_lines = { current_line = true })
