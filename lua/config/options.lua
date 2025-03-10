-- Options are automatically loaded before lazy.nvim startup
-- Hint: use `:h <option>`

local opt = vim.opt
local indent = 4

-- cursor
-- opt.guicursor = "" -- = fat cursor

opt.conceallevel = 2


-- allow use of mouse in Nvim
opt.mouse = "a"

opt.autowrite = true -- Enable auto write
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true -- Show some invisible whitespace characters (tabs...
-- opt.listchars = { tab = "␉·" }
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.listchars:append("space:·")
-- opt.listchars:append("nbsp:⎵")
-- opt.listchars:append("eol:⏎")
-- opt.listchars:append("tab:␉·")
-- opt.listchars:append("trail:␠")
-- opt.listchars:append("extends:>")
-- opt.listchars:append("precedes:<")

-- use system clipboard
opt.clipboard = "unnamedplus"
-- use system clipboard as default register
-- opt.clipboard:append("unnamedplus")

-- COMPLETION
opt.completeopt = { "menu", "menuone", "preview", "noselect" }
opt.shortmess:append "c"
opt.pumheight = 10

-- Tab
opt.tabstop = indent     -- number of visual spaces per TAB
opt.softtabstop = indent -- number of spacesin tab when editing
opt.expandtab = false    -- use spaces instead of tabs. Tabs are spaces, mainly for python

-- INDENT
opt.smartindent = true  -- smart with indent
opt.breakindent = true  -- enable break indent
opt.autoindent = true   -- indent new line same amount of previous line
opt.shiftwidth = indent -- set indentation width to 4 spaces. width of a TAB autoindent

-- UI config
opt.number = true         -- show absolute number
opt.relativenumber = true -- add numbers to each line on left side
opt.wrap = true           -- wrap lines
opt.scrolloff = 12        -- min number of lines around cursor (n above, n below) Minimal number of screen lines to keep above and below the cursor.
opt.sidescrolloff = 12    -- scroll page when cursror is # spaces from left/right
opt.splitbelow = true     -- open new vertical split botton
opt.splitright = true     -- open new horizontal splits right
opt.termguicolors = true  -- enable 24-bit RGB color in the TUI
opt.background = "dark"   -- colorschemes that can be light or dark will be made dark
opt.showmode = true       -- showing the mode ``-- INSERT --``
opt.showtabline = 0       -- always show tabs
opt.showcmd = true        -- show last command
opt.cmdheight = 0         -- more space in the neovim command line for displaying messages
opt.signcolumn = "yes"    -- always draw the sign column
opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
opt.cursorcolumn = false  -- vertical column on through the cursor
opt.colorcolumn = "88"    -- colorized the 88th column

opt.fillchars = { vert = "|" }
-- opt.shortmess:append { 'c' }
opt.laststatus = 3 -- always show statusline
opt.backspace = { "start", "eol", "indent" }

-- Searching
opt.incsearch = true         -- search as characters are entered
opt.hlsearch = true          -- whether to highlight matches
opt.ignorecase = true        -- ignore case in searches by default
opt.smartcase = true         -- whether to make case sensitive if an uppercase is entered
opt.inccommand = "split"     -- preview substitutions live, as you type!
opt.syntax = "ON"            -- syntax highlighting
opt.grepprg = "rg --vimgrep" -- ?

opt.updatetime = 300         -- update time for the swap file and for the cursor Hold event
opt.timeoutlen = 500
opt.ttimeoutlen = 10

-- BACKUP
opt.backup = false                                 -- no backup of current file is made
opt.swapfile = false                               -- default backup behaviour
opt.undofile = true                                -- undo file behaviour/save undo history
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- use the directory of undotree plugin for managing the history

-- CONTEXTUAL
opt.title = true                --set title of window automatically, useful for tabs plugin
opt.path:append({ "**" })       -- search (gf or :find) files down into subfolders
opt.titlestring = "Neovim - %t" -- title string
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"      -- encoding set to utf-8

-- CODE FOLDING
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
