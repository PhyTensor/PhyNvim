return {
    {
        "sainnhe/sonokai",
        lazy = true,
        priority = 1000,
        event = "VimEnter",
        config = function()
            vim.g.sonokai_transparent_background = "1"
            vim.g.sonokai_enable_italic = "1"
            vim.g.sonokai_style = "andromeda"
            -- vim.cmd.colorscheme("sonokai")
        end,
    },
}
