return {
    "nvim-neo-tree/neo-tree.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    otps = function()
        return require("plugins_options.neotree_options")
    end
}
