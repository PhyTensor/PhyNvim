return {
    "echasnovski/mini.icons",
    enabled = true,
    lazy = true,
    opts = {},
    specs = {
        { "nvim-tree/nvim-web-devicons", enabled = true, optional = true },
    },
    init = function()
        package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
        end
    end,
}
