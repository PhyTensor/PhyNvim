-- Autocmds are automatically loaded on the VeryLazy event
local M = {}

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- go to last line when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- when opening terminal in neovim
vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup("custom-neovim_terminal-open"),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- Removes any trailing whitespace when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "remove trailing whitespace on save",
    group = augroup("remove trailing trailing whitespace"),
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

-- fix comment on new line
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd([[set formatoptions-=cro]])
    end,
})

-- wrap words "softly" (no carriage return) in mail buffer
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "mail",
    callback = function()
        vim.opt.textwidth = 0
        vim.opt.wrapmargin = 0
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.columns = 80
        vim.opt.colorcolumn = "80"
    end,
})

-- If you're using Ruff alongside another language server (like Pyright), you may
-- want to defer to that language server for certain capabilities,
-- like textDocument/hover:
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client == nil then
--       return
--     end
--     if client.name == 'ruff' then
--       -- Disable hover in favor of Pyright
--       client.server_capabilities.hoverProvider = false
--     end
--   end,
--   desc = 'LSP: Disable hover capability from Ruff',
-- })

return M
