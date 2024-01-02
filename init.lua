-- Load core configs
require('core.remap')

-- Bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('plugins')

require("core.colorscheme")

-- modules not loaded by lazy
require('core.keymaps')
require('core.options')
require("core.mappings")
require("autocmds.autocmds")

-- plugins practice
-- function Todo() print("Hello, Karoki Tphy") end

-- :lua Todo()

-- manually invoking the function
-- vim.api.nvim_create_user_command("Todo", Todo, {})

-- use autocommands as response to actions/events
-- vim.api.nvim_create_autocmd("CursorHold", { callback = Todo })

-- using keymaps
-- vim.keymap.set('n', '<leader>u', Todo, {})
