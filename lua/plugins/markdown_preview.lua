return {
    "iamcco/markdown-preview.nvim",
    enabled = true,
    lazy = true,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- build = function()
    -- vim.fn["mkdp#util#install"]()
    -- end,

    -- build = 'cd app && yarn install',
    --     keys = {},
    --     init = function()
    --       vim.g.mkdp_filetypes = { 'markdown' }
    --     end,
}
