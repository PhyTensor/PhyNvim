-- GLOBAL OPTIONS
--
-- Hint: use `:h <option>`
--
-- vim.g.foo = bar
-- vim.opt.foo = bar
-- vim.cmd(some_vimscript)
--

local opt = vim.opt
local indent = 4

-- cursor
-- opt.guicursor =  -- "" = fat cursor

-- allow use of mouse in Nvim
opt.mouse = 'a'

-- use system clipboard
opt.clipboard = 'unnamedplus'
opt.clipboard:append { 'unnamedplus' }

-- COMPLETION
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.pumheight = 10

-- Tab
opt.tabstop = indent	    -- number of visual spaces per TAB
opt.softtabstop = indent    -- number of spacesin tab when editing
opt.expandtab = true		-- tabs are spaces, mainly for python

-- INDENT
opt.smartindent = true      -- smart with indent
opt.autoindent = true       -- indent new line same amount of previous line
opt.shiftwidth = indent     -- width of a TAB autoindent

-- UI config
opt.number = true		    -- show absolute number
opt.relativenumber = true	-- add numbers to each line on left side
opt.wrap = false            -- wrap lines
opt.scrolloff = 8           -- min number of lines around cursor (n above, n below)
opt.cursorline = true		-- highlight cursor line underneath the cursor horizontally
opt.splitbelow = true		-- open new vertical split botton
opt.splitright = true		-- open new horizontal splits right
opt.termguicolors = true    -- enable 24-bit RGB color in the TUI
opt.showmode = true         -- showing the mode ``-- INSERT --``
opt.signcolumn = 'yes'      -- always draw the sign column
opt.cursorcolumn = false    -- vertical column on through the cursor
-- opt.colorcolumn = '88'      -- colorized the 88th column

opt.fillchars = { vert = '|' }
-- opt.shortmess:append { 'c' }
opt.laststatus = 3

-- Searching
opt.incsearch = true        -- search as characters are entered
opt.hlsearch = true         -- whether to highlight matches
opt.ignorecase = true       -- ignore case in searches by default
opt.smartcase = true        -- whether to make case sensitive if an uppercase is entered
opt.inccommand = 'split'
opt.syntax = 'ON'           -- syntax highlighting
opt.grepprg = 'rg --vimgrep'

-- opt.updatetime = 50         -- update time for the swap file and for the cursor Hold event

-- BACKUP
opt.backup = false          -- no backup of current file is made
opt.swapfile = false        --default backup behaviour
opt.undofile = true         -- undo file behaviour
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'      -- use the directory of undotree plugin for managing the history

-- CONTEXTUAL
opt.title = true            --set title of window automatically, useful for tabs plugin
opt.path:append { '**' }    -- search (gf or :find) files down into subfolders

