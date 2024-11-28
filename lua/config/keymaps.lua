-- Keymaps are automatically loaded on the VeryLazy event

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


-- Quickly edit and source configuration
opts.desc = "Source Vim config"
map.set("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)
opts.desc = "Edit Vim config"
map.set("n", "<leader>ev", ":e $MYVIMRC<CR>", opts)


-- ESC
opts.desc = "Clear search highlights"
map.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", opts)

opts.desc = "Enter normal mode"
map.set("i", "jk", "<Esc>", opts)
map.set("i", "jj", "<Esc>", opts)
map.set("i", "kk", "<Esc>", opts)

-- Buffers
opts.desc = "Delete current buffer"
map.set("n", "<C-x>", "<cmd>bd<CR>", opts)

-- Window
opts.desc = "Close down neovim"
map.set("n", "<C-q>", "<C-w>q", opts)

-- Lazy
opts.desc = "Launch lazy"
map.set("n", "<leader>l", "<Cmd>Lazy<CR>", opts)

-- Oil
opts.desc = "Launch Oil"
map.set("n", "<leader>pv", "<Cmd>Oil<CR>", opts)
opts.desc = "Oil open parent directory in current window"
map.set("n", "-", "<CMD>Oil<CR>", opts)
opts.desc = "Oil open parent directory in floating window"
map.set("n", "<space>-", require("oil").toggle_float)

-- Undotree
opts.desc = "UndoTree Toggle"
map.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>", opts)

-- Neovim Project
opts.desc = "Find project based on patterns"
map.set("n", "<leader>pp", "<Cmd>Telescope neovim-project discover<CR>", opts)
opts.desc = "Select project based on recent history"
map.set("n", "<leader>ph", "<Cmd>Telescope neovim-project history<CR>", opts)

-- LazyGit
opts.desc = "Launch LazyGit"
map.set("n", "<leader>gg", "<Cmd>LazyGit<CR>", opts)

-- Noice
opts.desc = "Dismiss noice message"
map.set("n", "<leader>nd", "<Cmd>NoiceDismiss<CR>", opts)

-- ToggleTerm
opts.desc = "Toggle Neoterm"
map.set("n", "<leader>tt", "<cmd>NeotermToggle<CR>", opts)
map.set("t", "<leader>tt", "<cmd>NeotermToggle<CR>", opts)
opts.desc = "Exit Neoterm"
map.set("n", "<leader>tx", "<cmd>NeotermExit<CR>", opts)
map.set("t", "<leader>tx", "<cmd>NeotermExit<CR>", opts)

-- Navigation
-- map.set('i', '<C-S-H>', '<Left>', opts)
-- map.set('i', '<C-S-J>', '<Down>', opts)
-- map.set('i', '<C-S-K>', '<Up>', opts)
-- map.set('i', '<C-S-L>', '<Right>', opts)

-- map.set('v', '<leader>p', '\"_dp', { desc = "paste" })
opts.desc = "Paste without yanking"
map.set("v", "P", '"_dP', opts)

-- Better window navigation
-- opts.desc = "Move focus to the left window pane"
-- map.set("n", "<C-h>", "<C-w><C-h>", opts)
-- opts.desc = "Move focus to the down window pane"
-- map.set("n", "<C-j>", "<C-w><C-j>", opts)
-- opts.desc = "Move focus to the up window pane"
-- map.set("n", "<C-k>", "<C-w><C-k>", opts)
-- opts.desc = "Move focus to the right window pane"
-- map.set("n", "<C-l>", "<C-w><C-l>", opts)

-- Split Window
opts.desc = "Vertical Split Window RIGHT"
map.set("n", "<C-s>v", "<C-w>v", opts)
opts.desc = "Horizontal Split window BELOW"
map.set("n", "<C-s>s", "<C-w>s", opts)
opts.desc = "Close current split window"
map.set("n", "<C-s>x", "<Cmd>close<CR>", opts)
opts.desc = "Make split windows equal width and height"
map.set("n", "<C-s>=", "<C-w>=", opts)
opts.desc = "Delete window"
map.set("n", "<C-s>c", "<C-w>c", opts)

-- Resize with arrows
-- delta: 2 lines
opts.desc = "Resize Up"
map.set("n", "<C-Up>", ":resize -2<CR>", opts)
opts.desc = "Resize Down"
map.set("n", "<C-Down>", ":resize +2<CR>", opts)
opts.desc = "Resize Left"
map.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
opts.desc = "Resize Right"
map.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- keep cursor in the middle during half page jumps
opts.desc = "down - middle half page jumps"
map.set("n", "<C-d>", "<C-d>zz", opts)
opts.desc = "up - middle half page jumps"
map.set("n", "<C-u>", "<C-u>zz", opts)

-- keep cursor in middle during empty line jumps
opts.desc = "up - empy line jump"
map.set("n", "{", "{zzzv", opts)
opts.desc = "down - empty line jump"
map.set("n", "}", "}zzzv", opts)

-- keep cursor in middle when moving about search results
opts.desc = "next search result"
map.set("n", "n", "nzzzv", opts)
opts.desc = "prev search result"
map.set("n", "N", "Nzzzv", opts)

-- moving lines of code
-- map.set( 'n', 'J', ":m '>+<CR>gv=gv", opts )
-- map.set( 'n', 'K', ":m '<-<CR>gv=gv", opts )
-- Move Lines up and down
map.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Select all
opts.desc = "Select All"
map.set("n", "<leader>a", "gg<S-v>G", opts)

-- -- Move focus to the window using the <ctrl> hjkl keys in Tmux/Neovim Collab
-- opts.desc = "Goto right window pane"
-- map.set("n", "<C-l>", "<Cmd>:TmuxNavigateRight<CR>", opts)
-- opts.desc = "Goto left window pane"
-- map.set("n", "<C-h>", "<Cmd>:TmuxNavigateLeft<CR>", opts)
-- opts.desc = "Goto upper window pane"
-- map.set("n", "<C-k>", "<Cmd>:TmuxNavigateUp<CR>", opts)
-- opts.desc = "Goto lower window page"
-- map.set("n", "<C-j>", "<Cmd>:TmuxNavigateDown<CR>", opts)

-- NeoTree
-- -----------------------------------------------------------------------------------
opts.desc = "Neotree toggle filesystem"
map.set("n", "<leader>e", "<Cmd> Neotree filesystem toggle reveal left <CR>", opts)

-- opts.desc = "Neotree toggle filesystem"
-- map.set("n", "<leader>ee", "<Cmd> Neotree filesystem toggle reveal left <CR>", opts)
--
-- opts.desc = "Neotree toggle show list of currently open buffers"
-- map.set("n", "<leader>eb", "<Cmd> Neotree buffers toggle reveal left <CR>", opts)
--
-- opts.desc = "Neotree toggle show output of git status in tree layout"
-- map.set("n", "<leader>eg", "<Cmd> Neotree git_status toggle left <CR>", opts)
--
-- opts.desc = "Neotree toggle float filesystem"
-- map.set("n", "<leader>efe", "<Cmd> Neotree filesystem toggle reveal float <CR>", opts)
--
-- opts.desc = "Neotree toggle float show list of currently open buffers"
-- map.set("n", "<leader>efb", "<Cmd> Neotree buffers toggle reveal float <CR>", opts)
--
-- opts.desc = "Neotree toggle float show output of git status in tree layout"
-- map.set("n", "<leader>efg", "<Cmd> Neotree git_status toggle float <CR>", opts)
--
-- opts.desc = "NeoTree open file browser to the right"
-- map.set("n", "<leader>err", "<Cmd> Neotree filesystem reveal right <CR>", opts)
--
-- opts.desc = "NeoTree open file browser to the left"
-- map.set("n", "<leader>erl", "<Cmd> Neotree filesystem reveal left <CR>", opts)
--
-- opts.desc =
-- "Neotree show file browser window but f-- rename files through file exploerer and update affected import statements for LSPs that support itocus on current window"
-- map.set("n", "<leader>es", "<Cmd> Neotree filesystem toggle reveal left show <CR>", opts)
--
-- opts.desc = "Neotree close file browser window"
-- map.set("n", "<leader>ec", "<Cmd> Neotree close <CR>", opts)
---------------------------------------------------------------------------------------

-- Auto-Session
opts.desc = "Restore previously saved session based on cwd"
map.set("n", "<leader>wr", "<Cmd>SessionRestore<CR>", opts)
opts.desc = "Save workspace session in the set auto-session root dir"
map.set("n", "<leader>ws", "<Cmd>SessionSave<CR>", opts)

-- Trouble
opts.desc = "Toggle Trouble"
map.set("n", "<leader>xx", function()
    require("trouble").toggle()
end, opts)
opts.desc = "Trouble show lsp definitions from within builtin LSP client"
map.set("n", "gD", function()
    require("trouble").toggle("lsp_definitions")
end, opts) -- definitions of the word under the cursor from the builtin LSP client
opts.desc = "Trouble show lsp type definitions from within builtin LSP client"
map.set("n", "gd", function()
    require("trouble").toggle("lsp_type_definitions")
end, opts) -- type definitions of the word under the cursor from the builtin LSP client
opts.desc = "Trouble workspace diagnostics from within builtin LSP client"
map.set("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
end, opts) -- workspace diagnostics from builtin LSP client
opts.desc = "Trouble document diagnostics from within LSP client"
map.set("n", "<leader>xd", function()
    require("trouble").toggle("document_diagnostics")
end, opts) -- document diagnostics from builtin LSP client
opts.desc = "Trouble Quickfix"
map.set("n", "<leader>xq", function()
    require("trouble").toggle("quickfix")
end, opts) -- quickfix items
opts.desc = "Trouble show items from window's location list"
map.set("n", "<leader>xl", function()
    require("trouble").toggle("loclist")
end, opts) -- items from the window's location list
opts.desc = "Trouble LSP References"
map.set("n", "gR", function()
    require("trouble").toggle("lsp_references")
end, opts)

-- LSP
------------------------------------------------------
-- opts.desc = "Show code outline"
-- map.set({ 'n', 'v' }, '<leader>go', '<cmd>Lspsaga outline<cr>', opts)

opts.desc = "Show LSP references"
-- -- map.set('n', '<leader>gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
map.set("n", "<leader>gr", "<Cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
map.set("n", "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

opts.desc = "Go to lsp definitions"
map.set("n", "<leader>gd", "<Cmd>Telescope lsp_definitions<CR>", opts)
-- map.set('n', '<leader>gd', '<Cmd>Lspsaga goto_definition<CR>', opts)

opts.desc = "Show LSP implementations"
map.set("n", "<leader>gi", "<Cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
map.set("n", "<leader>gt", "<Cmd> Telescope lsp_type_definitions <CR>", opts)

opts.desc = "See available code actions"
map.set({ "n", "v" }, "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- map.set({ 'n', 'v' }, '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)

opts.desc = "Smart Rename"
map.set("n", "<leader>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- map.set('n', '<leader>rr', '<Cmd>Lspsaga rename<CR>', opts)

opts.desc = "Show buffer diagnostics for file"
map.set("n", "<leader>gb", "<Cmd> Telescope diagnostics bufnr=0 <CR>", opts)

opts.desc = "Show diagnostics for line"
map.set("n", "<leader>gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)

opts.desc = "Go to prev diagnostic message in buffer"
map.set("n", "<leader>gp", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
-- map.set('n', '<leader>gp', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

opts.desc = "Go to next diagnostic message in buffer"
map.set("n", "<leader>gn", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
-- map.set('n', '<leader>gn', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

opts.desc = "Open diagnostic Quickfix list"
map.set("n", "<leader>gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

opts.desc = "Show hover documentation"
map.set("n", "<leader>gh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- map.set('n', '<leader>gh', '<Cmd>Lspsaga hover_doc<CR>', opts)

opts.desc = "Restart the LSP"
map.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)

opts.desc = "Signature help"
map.set("n", "<leader>gs", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

opts.desc = "format"
map.set({ "n", "v" }, "<leader>gf", "<Cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)

opts.desc = "Document symbol"
map.set("n", "<leader>tr", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)

opts.desc = "Bring up completion window"
map.set("i", "<C-Space>", "<Cmd>lua vim.lsp.buf.completion()<CR>", opts)

------------------------------------------------------

-- Nvim-dap
map.set("n", "<leader>bb", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
map.set("n", "<leader>bc", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
map.set("n", "<leader>bl", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
map.set("n", "<leader>br", "<cmd>lua require('dap').clear_breakpoints()<cr>")
map.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
map.set("n", "<F5>", "<cmd>lua require('dap').continue()<cr>")
map.set("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>")
map.set("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>")
map.set("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>")
map.set("n", "<leader>dd", function()
    require("dap").disconnect()
    require("dapui").close()
end)
map.set("n", "<leader>dt", function()
    require("dap").terminate()
    require("dapui").close()
end)
map.set("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>")
map.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<cr>")
map.set("n", "<leader>di", function()
    require("dap.ui.widgets").hover()
end)
map.set("n", "<leader>d?", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end)
map.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
map.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
map.set("n", "<leader>de", function()
    require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)

-----------------
-- VISUAL MODE --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
opts.desc = "Indent Left"
map.set("v", "<", "<gv", opts)
opts.desc = "Indent Right"
map.set("v", ">", ">gv", opts)
