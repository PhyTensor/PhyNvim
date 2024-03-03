-- Load core configs
require('core.remap')
require("autocmds.autocmds")

require("configs.lazy")

require("core.colorscheme")

-- modules not loaded by lazy
require('core.keymaps')
require('core.options')

-- plugins practice
-- function Todo() print("Hello, Karoki Tphy") end

-- :lua Todo()

-- manually invoking the function
-- vim.api.nvim_create_user_command("Todo", Todo, {})

-- use autocommands as response to actions/events
-- vim.api.nvim_create_autocmd("CursorHold", { callback = Todo })

-- using keymaps
-- vim.keymap.set('n', '<leader>u', Todo, {})
