-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
          async = false,
          lsp_fallback = true,
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
  config = function(_, opts)
    local conform = require 'conform'

    vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
      conform.format {
        lsp_fallback = true,
        async = true,
        lsp_format = 'fallback',
        timeout_ms = 500,
      }
    end, { desc = '[F]or[M]at buffer or selected text in visual mode' })

    conform.setup(opts)
  end,
}
