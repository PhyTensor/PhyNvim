-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Reload config
vim.keymap.set("n", "<leader>R", ":source ~/.config/nvim/init.lua<CR>", { desc = "[R]eload config" })

-- Exit insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Clear search highlights on <Esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })

-- Save
vim.keymap.set("n", "<leader>sa", ":wall<CR>", { desc = "[S]ave [A]ll" })

-- Save all and Quit
vim.keymap.set("n", "<leader>sq", ":wqall<CR>", { desc = "[S]ave all and [Q]uit" })

-- Paste without yanking - keep last yanked when pasting
vim.keymap.set("v", "P", '"_dP', { desc = "Paste without yanking" })

-- Select all
vim.keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select All" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })

-- Launch Lazy
vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Launch Lazy" })

-- Oil - parent directory navigation
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "[Q]uickfix [O]pen" })
-- vim.keymap.set("n", "<leader>qo", vim.diagnostic.setloclist, { desc = "[Q]uickfix [O]pen" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "[Q]uickfix [C]lose" })

-- Splitting and Resizing windows
vim.keymap.set("n", "<C-s>", "<C-w>s", { desc = "[S]plit window horizontally" })
vim.keymap.set("n", "<C-v>", "<C-w>v", { desc = "[V]ertically split window" })
vim.keymap.set("n", "<C-c>", "<C-w>c", { desc = "[C]lose window" })
vim.keymap.set("n", "<C-x>", ":bdelete!<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equal width and height of split windows" })
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>", { desc = "Resize left vertical split window" })
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", { desc = "Resize right vertical split window" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- Move selection up/down
vim.keymap.set("v", "<C-A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Visual Maps
-- Hint: start visual mode with the same area as the previous area and in the same mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

vim.keymap.set("v", "<leader>sr", '"hy:%s/<C-r>h//g<left><left>', { desc = "Visual [S]earch and [R]eplace" })
