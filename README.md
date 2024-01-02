Hint: use `:h rtp`

Inspiration from:
- [nvim-from-scratch](https://github.com/ngscheurich/nvim-from-scratch)
- [nvim starter kit](https://github.com/bcampolo/nvim-starter-kit/tree/v0.0.1)
- [nvim-starter-kit](https://github.com/bcampolo/nvim-starter-kit)
- [nvim-config](https://github.com/oyinbra/nvim-config)

Install:
neovide

** Load plugins on specific events
*:help events*

- BufReadPre, BufNewFile: triggered before reading a file into buffer e.g. lualine, treesitter, gitsigns, lsp-zero
- InsertEnter: triggered when entering insert mode e.g. cmp, luasnip, autopairs
- LspAttach: triggered after LSP is active e.g. lspsaga, lsp-lines
- VeryLazy: loaded at end of lazy life cycle e.g. which-key, notify, tmux

