return {
    "rcarriga/nvim-notify",
    enabled = true,
    lazy = true,
    config = function()
        require("notify").setup({
            background_colour = "#000000",
            enabled = false,
        })
    end
}
