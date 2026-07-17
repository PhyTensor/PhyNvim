-- Exit insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Clear search highlights on <Esc>
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })

-- Save
vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save Buffer" })
vim.keymap.set("n", "<leader>wa", ":wall<CR>", { desc = "[S]ave [A]ll" })
vim.keymap.set("n", "<leader>wq", ":wqall<CR>", { desc = "[S]ave all and [Q]uit" })

-- Pase over selection without yanking
vim.keymap.set("v", "P", '"_dP', { desc = "Paste without yanking" })
-- Yank to system clipboard
vim.keymap.set("v", "y", [["+y]], { silent = true, desc = "Yank to system clipboard" })

-- Select all
vim.keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select All" })

-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Visual mode indentation (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent Left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Right" })

-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "*", "*zzzv", { desc = "Search Word (centered)" })
vim.keymap.set("n", "#", "#zzzv", { desc = "Search Word Back (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, center cursor" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>qd", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "[Q]uickfix [C]lose" })
vim.keymap.set("n", "<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
	{ desc = "Toggle diagnostics" })

-- Splitting windows
vim.keymap.set("n", "<C-s>", "<C-w>s", { desc = "[S]plit window horizontally" })
vim.keymap.set("n", "<C-^>", "<C-w>v", { desc = "[V]ertically split window" })
vim.keymap.set("n", "<C-v>", "<C-w>v", { desc = "[V]ertically split window" })

-- Window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equal width and height of split windows" })

-- Window navigation with CTRL+<hjkl>
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-x>", "<C-w>c", { desc = "[C]lose window" })
-- vim.keymap.set("n", "<C-x>", ":bdelete!<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers except current" })


-- Search and Replace - Visual mode
vim.keymap.set("v", "<leader>sr", '"hy:%s/<C-r>h//g<left><left>', { desc = "Visual [S]earch and [R]eplace" })

-- Search file-wide + Quickfix
vim.keymap.set({ "n", "v" }, "<leader>fw", function()
	local term = vim.fn.input("Search term: ")
	local ok = pcall(function()
		vim.cmd("vimgrep /" .. term .. "/ %")
	end)

	if ok then
		vim.cmd("copen")
	else
		vim.notify("No matches found", vim.log.levels.INFO)
	end
end, { desc = "Search current file and open quickfix" })

-- Search project-wide + Quickfix
vim.keymap.set(
	"n",
	"<leader>fp",
	function()
		local term = vim.fn.input("Search term: ")
		local ok = pcall(function()
			vim.cmd("vimgrep /" .. term .. "/ **/*")
		end)

		if ok then
			vim.cmd("copen")
		else
			vim.notify("No matches found in project", vim.log.levels.INFO)
		end
	end,
	{ desc = "Search project files and open quickfix" }
)

-- Quickfix navigation
vim.keymap.set("n", "]q", ":cnext<CR>zz", { desc = "Next quickfix item (centered)" })
vim.keymap.set("n", "[q", ":cprev<CR>zz", { desc = "Previous quickfix item (centered)" })
vim.keymap.set("n", "]Q", ":clast<CR>zz", { desc = "Last quickfix item (centered)" })
vim.keymap.set("n", "[Q", ":cfirst<CR>zz", { desc = "First quickfix item (centered)" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
