-- Similar to indent-blankline, this plugin can highlight the indent line,
-- and highlight the code chunk according to the current cursor position.
return {
    "shellRaining/hlchunk.nvim",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- "UIEnter"
    opts = {
        chunk = {
            enable = true
            -- ...
        },
        indent = {
            enable = true
            -- ...
        }
    },
    config = function(_, opts)
        require("hlchunk").setup(opts)
    end,
}
