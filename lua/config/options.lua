-- ============================================================================
-- Editor Behavior
-- ============================================================================
vim.opt.mouse = "a"                     -- Mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.undofile = true                 -- Persistent undo history to disk between sessions
vim.opt.undolevels = 10000              -- More undo history
vim.opt.autoread = true                 -- auto-reload files changes if outside of neovim
vim.opt.autowrite = false               -- do not auto-save
vim.opt.confirm = true                  -- Confirm before closing unsaved changes
vim.opt.updatetime = 200                -- Faster CursorHold events. Time in ms before CursorHold event trigers
vim.opt.timeoutlen = 300                -- Faster which-key popup. Time ms to wait for mapped key sequence to complete
vim.opt.ttimeoutlen = 0                 -- key code timeout
vim.opt.errorbells = false              -- no error sounds
vim.opt.backspace = "indent,eol,start"  -- better backspace behaviour

-- ============================================================================
-- UI/Display
-- ============================================================================
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors in the terminal
vim.opt.number = true             -- show absoluate line numbers
vim.opt.relativenumber = true     -- show relative line numbers
vim.opt.numberwidth = 4           -- minimum width of number column
vim.opt.wrap = true               -- wrap ling lines
vim.opt.breakindent = true        -- wrapped lines preserve indentation
vim.opt.cursorline = true         -- highlight current line
vim.opt.signcolumn = "yes:1"      -- always show sign column with width of 1
vim.opt.colorcolumn = "100"       -- show column at 100 characters
vim.opt.laststatus = 3            -- Global statusline
vim.opt.showmode = false           -- show mode in command line (show in statusline)
vim.opt.showmatch = true          -- highlights matching brackets
vim.opt.showcmd = true            -- show partial command in command line
vim.opt.ruler = true              -- show cursor position in command line
vim.opt.showtabline = 1           -- show tab line
vim.opt.cmdheight = 1             -- height of the commdn line area
vim.opt.pumheight = 12            -- maximum height of popup menu
vim.opt.pumblend = 10             -- Popup menu transparency
vim.opt.winblend = 10             -- Floating window transparency
vim.opt.fillchars = { eob = " " } -- Hide ~ characters on empty lines
vim.opt.winborder = "bold"        -- "rounded" -- use rounded borders for floating windows
-- vim.o.winborder = "rounded" -- Use rounded borders for floating windows
vim.opt.conceallevel = 0          -- do not hide markup
vim.opt.concealcursor = "niv"     -- do not hide cursorline in markup
vim.opt.lazyredraw = true         -- do not redraw during macros
vim.opt.synmaxcol = 300           -- syntax highlighting limit
vim.opt.hidden = true            -- allow hidden buffers

-- ============================================================================
-- Search
-- ============================================================================
vim.opt.hlsearch = true   -- Highlight all search results
vim.opt.incsearch = true  -- Show search matches as you type
vim.opt.ignorecase = true -- Ignore case in search patterns. Case insensitive search
vim.opt.smartcase = true  -- Override ignorecase if pattern contains uppercase
-- vim.opt.inccommand = "split" -- Live preview for substitutions

-- ============================================================================
-- Indentation
-- ============================================================================
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4     -- Number os spaces for each indentation level
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.autoindent = true
vim.opt.smartindent = true -- Auto-indent new lines based on syntax

-- ============================================================================
-- Splits
-- ============================================================================
vim.opt.splitbelow = true -- Open horizontal splits below current window
vim.opt.splitright = true -- Open vertical splits to the right of the current window

-- ============================================================================
-- Files
-- ============================================================================
vim.opt.encoding = "utf-8"  -- File encoding for new files
vim.opt.swapfile = false    -- don't create swap files
vim.opt.backup = false      -- don't create backup files before overwriting
vim.opt.writebackup = false -- don't create backup files while editing

-- ============================================================================
-- Completion
-- ============================================================================
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Completion menu options

-- ============================================================================
-- Syntax
-- ============================================================================
vim.opt.redrawtime = 10000             -- Faster syntax highlighting timeout. Increased redraw tolerance
vim.opt.maxmempattern = 20000          -- increase max memory
vim.opt.wildmenu = true                -- tab completion
vim.opt.wildmode = "longest:full,full" -- tab completion longest common match, full completion list
vim.opt.diffopt:append("linematch:60") -- improve diff display

-- ============================================================================
-- Other
-- ============================================================================
vim.opt.title = true              -- Set window title to filename
vim.opt.guifont = "monospace:h17" -- Font for GUI Neovim (e.g., Neovide)

-- ============================================================================
-- Scrolling
-- ============================================================================
vim.opt.scrolloff = 10     -- keep # lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep # lines left/right of cursor
vim.opt.smoothscroll = true
