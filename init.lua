-- Core Configuration
require('config.globals')
require('config.options')
require('config.autocmds')
require('config.keymaps')

-- Plugin Management
require('plugins')
-- LSP Configuration
local lsp_servers = {
    "lua_ls",
    "pylsp",
    "godot",
    "roslyn",
    "yamlls",
    "jsonls",
    "qmlls",
    "cssls",
    "html",
    "ts_ls",
    "vue_ls",
    "hyprls",
}

for _, server in ipairs(lsp_servers) do
    local ok, err = pcall(vim.lsp.enable, server)
    if not ok then
        vim.notify("Failed to enable LSP: " .. server .. " - " .. err, vim.log.levels.WARN)
    end
end

-- Colorscheme
vim.cmd.colorscheme("onedark")

-- LSP Keymaps and Autocmds
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Custom LSP keymaps (beyond Neovim 0.11+ defaults)
        map("gF", function() vim.lsp.buf.format() end, "[F]ormat")
        map("gO", function() vim.lsp.buf.document_symbol() end, "Document Symbol")
        map("gS", function() vim.lsp.buf.signature_help() end, "Signature Help")
        map("grs", function() vim.lsp.buf.workspace_symbol() end, "Workspace Symbol")

        -- Override K with rounded border
        map("K", function() vim.lsp.buf.hover({
            border = "rounded",
            max_height = 25,
            max_width = 120,
        }) end, "Hover Documentation")

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Document highlight on cursor hold
        if client and client:supports_method(
            vim.lsp.protocol.Methods.textDocument_documentHighlight,
            event.buf
        ) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = "lsp-highlight",
                        buffer = event2.buf
                    })
                end,
            })
        end

        -- Toggle inlay hints
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map("<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
            end, "[T]oggle Inlay [H]ints")
        end
    end,
})
