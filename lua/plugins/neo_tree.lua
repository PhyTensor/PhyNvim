return {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        { "3rd/image.nvim", lazy = true },
    },
    otps = function()
        return require("plugins_options.neotree_options")
    end
}
