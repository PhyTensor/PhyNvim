require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        -- sidebars = "transparent",
        -- floats = "transparent",
    },
    on_highlights = function(hl, c)
        -- Softer line numbers
        hl.LineNr = { fg = c.dark3 }
        hl.CursorLineNr = { fg = c.orange, bold = true }
    end,
})
