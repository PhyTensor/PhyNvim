return {
    "jinh0/eyeliner.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- show highlights only after keypress
        highlight_on_key = true,
        -- dim all other characters if set to true (recommended!)
        dim = true,
    },
    config = function(_, opts)
        require("eyeliner").setup(opts)
    end,
}
