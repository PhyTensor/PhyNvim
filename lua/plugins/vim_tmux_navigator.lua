local M = { 'christoomey/vim-tmux-navigator' }

M.cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
}

M.keys = {
    { "<C-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<C-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<C-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<C-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
}

return M
