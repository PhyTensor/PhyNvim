--  Install poppler engine - zathura-pdf-poppler
--  Latexmk is part of the texlive-binextra package now.
return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        -- " Viewer options: One may configure the viewer either by specifying a built-in
        -- " viewer method:
        vim.g.vimtex_view_method = "zathura"
        vim.g.tex_flavor = "latex"
        vim.g.vimtex_quickfix_mode = 0

        -- configure the concealment. i.e. latex code is replaced or made invisible
        -- when cursor is not on that line.
        vim.opt_local.conceallevel = 1
        vim.g.tex_conceal = "abdmg"

        vim.g.vimtex_compiler_method = 'latexmk'

        -- " Or with a generic interface:
        vim.g.vimtex_view_general_viewer = 'microsoft-edge-stable'
        -- vim.g.vimtex_view_general_options = "--unique file:@pdf\#src:@line@tex"
    end,
    ft = { "tex", "latex", "markdown" },
}
