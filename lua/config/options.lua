-- ============================================================================
-- Editor Behavior
-- ============================================================================
vim.opt.mouse = "a"                     -- Mouse support
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.undofile = true                 -- Persistent undo history to disk between sessions
vim.opt.undolevels = 10000              -- More undo history
vim.opt.autoread = true                 -- Automatically reload files changed outside of neovim
vim.opt.confirm = true                  -- Confirm before closing unsaved changes
vim.opt.updatetime = 200                -- Faster CursorHold events. Time in ms before CursorHold event trigers
vim.opt.timeoutlen = 300                -- Faster which-key popup. TIme ms to wait for mapped key sequence to complete

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
vim.opt.laststatus = 3            -- Global statusline
vim.opt.showmode = true           -- show mode in command line (show in statusline)
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
vim.opt.fileencoding = "utf-8" -- File encoding for new files
vim.opt.swapfile = false       -- don't create swap files
vim.opt.backup = false         -- don't create backup files before overwriting
vim.opt.writebackup = false    -- don't create backup files while editing

-- ============================================================================
-- Completion
-- ============================================================================
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Completion menu options
vim.opt.conceallevel = 0                                -- Show all text normally (no concealment)

-- ============================================================================
-- Syntax
-- ============================================================================
vim.opt.redrawtime = 1500 -- Faster syntax highlighting timeout

-- ============================================================================
-- Other
-- ============================================================================
vim.opt.title = true              -- Set window title to filename
vim.opt.guifont = "monospace:h17" -- Font for GUI Neovim (e.g., Neovide)

-- ============================================================================
-- Scrolling
-- ============================================================================
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true
