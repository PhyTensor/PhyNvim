-- KEY MAPPINGS
--
-- Hint: use `:h vim.keymap.set`
--
-- vim.keymap.set(<mode>, <key>, <action>, <opts>)
--

-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}


local map = vim.keymap

-----------------
-- NORMAL MODE --
-----------------

-- Hint: use `:h vim.map.set()`
--
-- Netrw Directory listing
-- opts.desc = "Show Netrw directory listing"
-- map.set('n', '<leader>pv', vim.cmd.Ex, opts)


-- ESC
opts.desc = "Clear search highlights"
map.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', opts)


-- Buffers
opts.desc = "Delete current buffer"
map.set('n', '<C-x>', '<cmd>bd<CR>', opts)


-- Window
opts.desc = "Close down neovim"
map.set('n', '<C-q>', '<C-w>q', opts)

-- Lazy
opts.desc = "Launch lazy"
map.set('n', '<leader>l', '<Cmd>Lazy<CR>', opts)


-- Oil
opts.desc = "Launch Oil"
map.set('n', '<leader>p', '<Cmd>Oil<CR>', opts)


-- LazyGit
opts.desc = "Launch LazyGit"
map.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', opts)


-- Navigation
--map.set( 'n', '<Left>', '<C-w>h', opts )
--map.set( 'n', '<Down>', '<C-w>j', opts )
--map.set( 'n', '<Up>', '<C-w>k', opts )
--map.set( 'n', '<Right>', '<C-w>l', opts )


-- Better window navigation
opts.desc = "Move to left window pane"
map.set('n', '<C-h>', '<C-w>h', opts)
opts.desc = "Move to down window pane"
map.set('n', '<C-j>', '<C-w>j', opts)
opts.desc = "Move to up window pane"
map.set('n', '<C-k>', '<C-w>k', opts)
opts.desc = "Move to right window pane"
map.set('n', '<C-l>', '<C-w>l', opts)


-- Split Window
opts.desc = "Vertical Split Window"
map.set('n', '<C-s>s', '<C-w>v', opts)
opts.desc = "Horizontal Split window"
map.set('n', '<C-s>v', '<C-w>s', opts)
opts.desc = "Close current split window"
map.set('n', '<C-s>x', '<Cmd>close<CR>', opts)
opts.desc = "Make split windows equal width and height"
map.set('n', '<C-s>=', '<C-w>=', opts)

-- Resize with arrows
-- delta: 2 lines
opts.desc = "Resize Up"
map.set('n', '<C-Up>', ':resize -2<CR>', opts)
opts.desc = "Resize Down"
map.set('n', '<C-Down>', ':resize +2<CR>', opts)
opts.desc = "Resize Left"
map.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
opts.desc = "Resize Right"
map.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


-- moving lines of code
-- map.set( 'n', 'J', ":m '>+<CR>gv=gv", opts )
-- map.set( 'n', 'K', ":m '<-<CR>gv=gv", opts )


-- Select all
opts.desc = "Select All"
map.set('n', '<leader>a', 'gg<S-v>G', opts)


-- Nvim Tree
-- opts.desc = "NvimTree Toggle"
-- map.set('n', '<leader>ee', '<Cmd> NvimTreeToggle <CR>', opts)
-- opts.desc = "NvimTree Focus"
-- map.set('n', '<leader>ef', '<Cmd> NvimTreeFocus <CR>', opts)


-- NeoTree
-- -----------------------------------------------------------------------------------
opts.desc = "Neotree toggle filesystem"
map.set('n', '<leader>ee', '<Cmd> Neotree filesystem toggle reveal left <CR>', opts)

opts.desc = "Neotree toggle show list of currently open buffers"
map.set('n', '<leader>eb', '<Cmd> Neotree buffers toggle reveal left <CR>', opts)

opts.desc = "Neotree toggle show output of git status in tree layout"
map.set('n', '<leader>eg', '<Cmd> Neotree git_status toggle left <CR>', opts)

opts.desc = "Neotree toggle float filesystem"
map.set('n', '<leader>efe', '<Cmd> Neotree filesystem toggle reveal float <CR>', opts)

opts.desc = "Neotree toggle float show list of currently open buffers"
map.set('n', '<leader>efb', '<Cmd> Neotree buffers toggle reveal float <CR>', opts)

opts.desc = "Neotree toggle float show output of git status in tree layout"
map.set('n', '<leader>efg', '<Cmd> Neotree git_status toggle float <CR>', opts)

opts.desc = "NeoTree open file browser to the right"
map.set('n', '<leader>err', '<Cmd> Neotree filesystem reveal right <CR>', opts)

opts.desc = "NeoTree open file browser to the left"
map.set('n', '<leader>erl', '<Cmd> Neotree filesystem reveal left <CR>', opts)

opts.desc = "Neotree show file browser window but focus on current window"
map.set('n', '<leader>es', '<Cmd> Neotree filesystem toggle reveal left show <CR>', opts)

opts.desc = "Neotree close file browser window"
map.set('n', '<leader>ec', '<Cmd> Neotree close <CR>', opts)
---------------------------------------------------------------------------------------


-- Auto-Session
opts.desc = "Restore previously saved session based on cwd"
map.set('n', '<leader>wr', '<Cmd>SessionRestore<CR>', opts)
opts.desc = "Save workspace session in the set auto-session root dir"
map.set('n', '<leader>ws', '<Cmd>SessionSave<CR>', opts)


-- Trouble
opts.desc = "Toggle Trouble"
map.set('n', '<leader>xx', function() require('trouble').toggle() end, opts)
opts.desc = "Trouble show lsp definitions from within builtin LSP client"
map.set('n', 'gD', function() require('trouble').toggle("lsp_definitions") end, opts)               -- definitions of the word under the cursor from the builtin LSP client
opts.desc = "Trouble show lsp type definitions from within builtin LSP client"
map.set('n', 'gd', function() require('trouble').toggle("lsp_type_definitions") end, opts)          -- type definitions of the word under the cursor from the builtin LSP client
opts.desc = "Trouble workspace diagnostics from within builtin LSP client"
map.set('n', '<leader>xw', function() require('trouble').toggle("workspace_diagnostics") end, opts) -- workspace diagnostics from builtin LSP client
opts.desc = "Trouble document diagnostics from within LSP client"
map.set('n', '<leader>xd', function() require('trouble').toggle("document_diagnostics") end, opts)  -- document diagnostics from builtin LSP client
opts.desc = "Trouble Quickfix"
map.set('n', '<leader>xq', function() require('trouble').toggle("quickfix") end, opts)              -- quickfix items
opts.desc = "Trouble show items from window's location list"
map.set('n', '<leader>xl', function() require('trouble').toggle("loclist") end, opts)               -- items from the window's location list
opts.desc = "Trouble LSP References"
map.set('n', 'gR', function() require('trouble').toggle("lsp_references") end, opts)


-- LSP
------------------------------------------------------
opts.desc = "Show LSP references"
-- map.set( 'n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts )
map.set('n', '<leader>gr', '<Cmd>Telescope lsp_references<CR>', opts)

opts.desc = "Go to declaration"
map.set('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

opts.desc = "Show lsp definitions"
map.set('n', '<leader>gd', '<Cmd>Telescope lsp_definitions<CR>', opts)

opts.desc = "Show LSP implementations"
map.set('n', '<leader>gi', '<Cmd>Telescope lsp_implementations<CR>', opts)

opts.desc = "Show LSP type definitions"
map.set('n', '<leader>gt', '<Cmd> Telescope lsp_type_definitions <CR>', opts)

opts.desc = "See available code actions"
map.set({ 'n', 'v' }, '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

opts.desc = "Smart Rename"
map.set('n', '<leader>rr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

opts.desc = "Show buffer diagnostics for file"
map.set('n', '<leader>gb', '<Cmd> Telescope diagnostics bufnr=0 <CR>', opts)

opts.desc = "Show diagnostics for line"
map.set('n', '<leader>gl', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)

opts.desc = "Go to prev diagnostic in buffer"
map.set('n', '<leader>gp', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

opts.desc = "Go to next diagnostic in buffer"
map.set('n', '<leader>gn', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)

opts.desc = "Show hover documentation"
map.set('n', '<leader>gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

opts.desc = "Restart the LSP"
map.set('n', '<leader>rs', '<cmd>LspRestart<CR>', opts)

opts.desc = "Signature help"
map.set('n', '<leader>gs', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

opts.desc = "format"
map.set({ 'n', 'v' }, '<leader>gf', '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)

opts.desc = "Document symbol"
map.set('n', '<leader>tr', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)

opts.desc = "Bring up completion window"
map.set('i', '<C-Space>', '<Cmd>lua vim.lsp.buf.completion()<CR>', opts)

------------------------------------------------------


-- Nvim-dap
map.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
map.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
map.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
map.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
map.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
map.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
map.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
map.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
map.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
map.set("n", '<leader>dd', function()
    require('dap').disconnect(); require('dapui').close();
end)
map.set("n", '<leader>dt', function()
    require('dap').terminate(); require('dapui').close();
end)
map.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
map.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
map.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
map.set("n", '<leader>d?',
    function()
        local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
    end)
map.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
map.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
map.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end)



-----------------
-- VISUAL MODE --
-----------------


-- Hint: start visual mode with the same area as the previous area and the same mode
opts.desc = "Indent Left"
map.set('v', '<', '<gv', opts)
opts.desc = "Indent Right"
map.set('v', '>', '>gv', opts)
