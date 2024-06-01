return {
  "stevearc/conform.nvim",
  enabled = true,
  event = {
    "LspAttach",
    "BufWritePre",
  },
  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      -- javascript = { "prettier" },
      -- typescript = { "prettier" },
      -- javascriptreact = { "prettier" },
      -- typescriptreact = { "prettier" },
      -- svelte = { "prettier" },
      -- css = { "prettier" },
      -- html = { "prettier" },
      -- json = { "prettier", "prettierd" },
      -- yaml = { "prettier", "yamlfix" },
      -- markdown = { "prettier", "prettierd" },
      -- graphql = { "prettier" },
      -- lua = { "stylua" },
      -- kotlin = { "ktlint" },
      -- python = { "isort", "ruff" },
      cs = { "csharpier" },
    },
    formatters = {
      csharpier = {
        command = "dotnet-csharpier",
        args = { "--write-stdout" },
      },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 2000,
    },
  },
  config = function(_, opts)
    local conform = require("conform")

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    conform.setup(opts)
  end,
}
