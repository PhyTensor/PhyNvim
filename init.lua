vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.winborder = "bold"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.keymap.set('n', '<leader>wq', ':write<CR> :quit<CR>')
vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim",  name = "catppuccin" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp" },
})

require("oil").setup({
		view_options = {
				show_hidden = true
		}
})

require("fidget").setup({
		notification = {
				window = {
						winblend = 0
				}
		}
})

require("blink.cmp").setup({
		signature = { enabled = true },
		completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 0 },
				menu = {
						auto_show = true,
						draw = {
								columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
						},
				},
		},
})

vim.lsp.enable({
	"lua_ls"
})

vim.cmd.colorscheme("catppuccin-mocha")

-- Neovim Native Autocompletion Trigger
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 		group = vim.api.nvim_create_augroup("my.lsp", {}),
-- 		callback = function(args)
-- 				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--
-- 				if client:supports_method('textDocument/completion') then
-- 						vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
-- 				end
-- 		end,
-- })
-- vim.cmd("set completeopt+=noselect")



