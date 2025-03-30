return {
    "kylechui/nvim-surround",
    enabled = true,
    lazy = true,
    version = '*',
    opts = {},
    config = function(_, opts)
        require("nvim-surround").setup(opts)
    end
}
