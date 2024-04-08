return {
    "nobbmaestro/nvim-andromeda",
    lazy = true,
    priority = 1000,
    dependencies = {
        { "tjdevries/colorbuddy.nvim", branch = "dev" },
    },
    opts = {
        preset = "andromeda",
        transparent_bg = false,
    },
}
