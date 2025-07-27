-- Basic settings
vim.opt.number = true         -- Make line numbers default
vim.opt.relativenumber = true -- You can also add relative line numbers, to help with jumping.
vim.opt.cursorline = true     -- Show which line your cursor is on
vim.opt.wrap = false          -- disable text line wrapping
vim.opt.scrolloff = 12        -- Minimal number of screen lines to keep above and below the cursor. scroll page when cursor is # lines
vim.opt.sidescrolloff = 12    -- scroll page when cursor is # column spaces left/right

-- Indentation
vim.opt.tabstop = 4        -- Tab width
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.softtabstop = 4    -- Number of spaces inserted when pressing <Tab>
vim.opt.expandtab = true   -- convert tabs to spaces
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true  -- Copy indent from current line

-- Search settings
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true  -- Case sensitive if uppercase in search
vim.opt.hlsearch = false  -- disable all highlighted search results
vim.opt.incsearch = true  -- enable incremental search i.e. show matches as you type

-- Visual settings
vim.opt.termguicolors = true                                                                     -- Enable 24-bit colors
vim.opt.signcolumn =
"auto"                                                                                           -- "yes" -- Keep signcolumn on by default
vim.opt.colorcolumn =
""                                                                                               -- Show column at 80 characters
vim.opt.showmatch = true                                                                         -- Highlight matching brackets
vim.opt.matchtime = 3                                                                            -- How long to show matching brackets
vim.opt.showcmd = false                                                                          -- Don't show extra info at the bottom
vim.opt.cmdheight = 0                                                                            -- Command line height
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "fuzzy", "popup", "preview" } -- Completion options
vim.opt.showmode = false                                                                         -- Don't show the mode, since it's already in the status line
vim.opt.pumheight = 10                                                                           -- Popup menu height
vim.opt.pumblend = 10                                                                            -- Popup menu transparency
vim.opt.winblend = 0                                                                             -- Floating window transparency
vim.opt.winborder = "rounded"                                                                    -- default border for all floating windows
vim.opt.conceallevel = 0                                                                         -- Don't hide markup
vim.opt.concealcursor =
""                                                                                               -- Don't hide cursor when typing markup
vim.opt.lazyredraw = true                                                                        -- Don't redraw during macros
vim.opt.synmaxcol = 300                                                                          -- Syntax highlighting limit

-- File handling
vim.opt.backup = false                                      -- Don't create backup files
vim.opt.writebackup = false                                 -- Don't create backup before writing
vim.opt.swapfile = false                                    -- Don't create swap files
vim.opt.undofile = true                                     -- Save undo history i.e. persistent undo
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo") -- undo directory
vim.opt.updatetime = 300                                    -- Decrease update time i.e. faster completion
vim.opt.timeoutlen = 500                                    -- Decrease mapped sequence wait time i.e. key timeout duration
vim.opt.ttimeoutlen = 0                                     -- Key code timeout
vim.opt.autoread = true                                     -- Auto reload files changed outside of vim
vim.opt.autowrite = false                                   -- Don't auto save

-- Behaviour settings
vim.opt.hidden = true                   --Allow hidden buffers
vim.opt.errorbells = false              -- No error bells
vim.opt.backspace = "indent,eol,start"  -- Better Backspace Behaviour
vim.opt.autochdir = false               -- Don't auto change directory
vim.opt.path:append("**")               -- Include subdirectories in search
vim.opt.selection = "exclusive"         -- Selection behaviour
vim.opt.mouse = "a"                     -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard. Sync clipboard between OS and Neovim.
vim.opt.modifiable = true               -- Allow buffer modifications
vim.opt.fileencoding = "UTF-8"

-- Split settings. Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- LSP
vim.lsp.inlay_hint.enable(true)

-- Performance imrovements
vim.opt.redrawtime = 10000    -- Don't redraw during macros
vim.opt.maxmempattern = 20000 -- Increase memory limit
