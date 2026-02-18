local function augroup(name)
    return vim.api.nvim_create_augroup("UserConfig_" .. name, { clear = true })
end

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = augroup("highlight_yank"),
    pattern = "*",
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Removes any trailing whitespace when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Remove trailing whitespace on save",
    group = augroup("trailing_whitespace"),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Go to last cursor position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Go to last cursor position when opening files",
    group = augroup("last_loc"),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto-create parent directories when saving
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Auto-create parent directories when saving",
    group = augroup("auto_create_dir"),
    callback = function(event)
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Check if file changed outside of Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    desc = "Check if file changed outside of Neovim",
    group = augroup("checktime"),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- Resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    desc = "Resize splits when window is resized",
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})
