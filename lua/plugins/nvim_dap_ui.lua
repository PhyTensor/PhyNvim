return {
    "rcarriga/nvim-dap-ui",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mfussenegger/nvim-dap",
        "theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
        "nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
        "nvim-neotest/nvim-nio",
    },
    opts = {
        controls = {
            element = "repl",
            enabled = false,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = "",
            },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "rounded",
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = "",
        },
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.5,
                    },
                    {
                        id = "stacks",
                        size = 0.34,
                    },
                    {
                        id = "watches",
                        size = 0.15,
                    },
                    {
                        id = "breakpoints",
                        size = 0.01,
                    },
                },
                position = "left",
                size = 50,
            },
            {
                elements = {
                    {
                        id = "console",
                        size = 0.75,
                    },
                    {
                        id = "repl",
                        size = 0.25,
                    },
                },
                position = "bottom",
                size = 10,
            },
        },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t",
        },
        render = {
            indent = 1,
            max_value_lines = 100,
        },
    },
    config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup(opts)

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end

        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- csharp
        dap.adapters.coreclr = {
            type = "executable",
            command = "/usr/local/bin/netcoredbg/netcoredbg",
            args = { "--interpreter=vscode" },
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net8.0/", "file")
                end,
            },
        }
    end,
}
