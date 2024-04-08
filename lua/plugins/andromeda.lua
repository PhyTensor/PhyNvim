return {
    "nobbmaestro/nvim-andromeda",
    lazy = true,
    priority = 1000,
    dependencies = {
        { "tjdevries/colorbuddy.nvim", branch = "dev" },
    },
    config = function()
        require("andromeda").setup({
            preset = "andromeda",
            transparent_bg = false,
        })
    end
}
