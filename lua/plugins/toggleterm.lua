return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    cmd = { "TermExce", "ToggleTerm" },
    -- opts = {},
    -- config = true,
    config = function()
        require("toggleterm").setup({
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            start_in_insert = true,
        })
    end
}
