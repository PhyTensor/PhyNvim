-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Built-in Autocompletion
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--
--     -- enable completion when available
--     if client:supports_method 'textDocument/completion' then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })

-- Show Diagnostic virtual text
-- vim.diagnostic.config({ virtual_text = true })
-- Show diagnostic virtual text only at current cursor line
-- vim.diagnostic.config({ virtual_text = { current_line = true })
-- Show Diagnostic virtual lines
-- vim.diagnostic.config { virtual_lines = true }
-- Show diagnostic virtual lines and text only at current cursor line
-- vim.diagnostic.config({ virtual_lines = { current_line = true })
