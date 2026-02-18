-- Visual & Display
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.winborder = "bold"
vim.opt.laststatus = 3                  -- Global statusline

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Aesthetics
vim.opt.pumblend = 10                   -- Popup menu transparency
vim.opt.winblend = 10                   -- Floating window transparency
vim.opt.fillchars = {
    eob = " ",                          -- Hide ~ on empty lines
}

-- Performance
vim.opt.updatetime = 200                -- Faster CursorHold events
vim.opt.timeoutlen = 300                -- Faster which-key popup
vim.opt.redrawtime = 1500               -- Faster syntax highlighting timeout

-- Search
vim.opt.ignorecase = true               -- Case insensitive search
vim.opt.smartcase = true                -- Unless uppercase used
vim.opt.inccommand = "split"            -- Live preview for substitutions

-- Files & Persistence
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true                 -- Persistent undo
vim.opt.undolevels = 10000              -- More undo history

-- Windows & Splits
vim.opt.splitbelow = true               -- Horizontal splits below
vim.opt.splitright = true               -- Vertical splits right
vim.opt.confirm = true                  -- Confirm before closing unsaved

-- System Integration
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard
vim.opt.mouse = "a"                     -- Mouse support
