-- KEY MAPPINGS
--
-- Hint: use `:h vim.keymap.set`
--
-- vim.keymap.set(<mode>, <key>, <action>, <opts>)
--

-- define common options
local opts = {
    noremap = true,     -- non-recursive
    silent = true,      -- do not show message
}

local map = vim.keymap

-----------------
-- NORMAL MODE --
-----------------

-- Hint: use `:h vim.map.set()`
--
-- Netrw Directory listing
map.set( 'n', '<leader>pv', vim.cmd.Ex, opts )

-- ESC
map.set( 'n', '<Esc>', '<Cmd>nohlsearch<CR>', opts )

-- Lazy
map.set( 'n', '<leader>p', '<Cmd>Lazy<CR>', { desc = 'Plugins' } )

-- Navigation
--map.set( 'n', '<Left>', '<C-w>h', opts )
--map.set( 'n', '<Down>', '<C-w>j', opts )
--map.set( 'n', '<Up>', '<C-w>k', opts )
--map.set( 'n', '<Right>', '<C-w>l', opts )

-- Better window navigation
map.set( 'n', '<C-h>', '<C-w>h', opts )
map.set( 'n', '<C-j>', '<C-w>j', opts )
map.set( 'n', '<C-k>', '<C-w>k', opts )
map.set( 'n', '<C-l>', '<C-w>l', opts )

-- Resize with arrows
-- delta: 2 lines
map.set( 'n', '<C-Up>', ':resize -2<CR>', opts )
map.set( 'n', '<C-Down>', ':resize +2<CR>', opts )
map.set( 'n', '<C-Left>', ':vertical resize -2<CR>', opts )
map.set( 'n', '<C-Right>', ':vertical resize +2<CR>', opts )

-- moving lines of code
-- map.set( 'n', 'J', ":m '>+<CR>gv=gv", opts )
-- map.set( 'n', 'K', ":m '<-<CR>gv=gv", opts )

-- Nvim Tree
map.set( 'n', '<leader>ee', '<Cmd> NvimTreeToggle <CR>', opts )
map.set( 'n', '<leader>ef', '<Cmd> NvimTreeFocus <CR>', opts )

-----------------
-- VISUAL MODE --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
map.set( 'v', '<', '<gv', opts )
map.set( 'v', '>', '>gv', opts )

