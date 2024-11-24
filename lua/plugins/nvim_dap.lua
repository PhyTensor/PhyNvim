return {
    "mfussenegger/nvim-dap",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        -- require("core.mappings").load_mappings("dap")
        -- require("core.mappings")--.("dap")
    end,
}
