-- [[ Setting Options ]]
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.guifont = "monospace:h12"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- before all highlighted search results
vim.opt.hlsearch = false -- disable all highlighted search results
vim.opt.incsearch = true -- enable incremental search

vim.opt.wrap = false -- disable text line wrapping

vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.smartindent = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "auto" -- "yes"

vim.opt.showtabline = 2 -- always show tabline

vim.opt.laststatus = 3 -- always show statusline

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor. scroll page when cursor is # lines
vim.opt.scrolloff = 12
-- scroll page when cursor is # spaces
vim.opt.sidescrolloff = 12

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

vim.opt.showcmd = false
vim.opt.cmdheight = 1

vim.opt.fileencoding = "utf-8"
