local function augroup(name)
	return vim.api.nvim_create_augroup("UserConfig_" .. name, { clear = true })
end

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("phnvim-highlight-yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Removes any trailing whitespace when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "remove trailing whitespace on save",
	group = augroup("remove trailing trailing whitespace"),
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

