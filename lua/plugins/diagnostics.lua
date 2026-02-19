-- Inline diagnostics. Prettier diagnostic display
require("tiny-inline-diagnostic").setup({
    options = {
        show_source = { enabled = true },
        use_icons_from_diagnostic = false,
        set_arrow_to_diag_color = false,
        add_messages = true,
        throttle = 20,
        softwrap = 30,
        multilines = { enabled = true },
        show_all_diags_on_cursorline = false,
        enable_on_insert = false,
        enable_on_select = false,
        overflow = { mode = "wrap", padding = 0 },
        break_line = { enabled = false, after = 30 },
        format = nil,
        virt_texts = { priority = 2048 },
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
        },
        overwrite_events = nil,
    },
    disabled_ft = {},
    transparent_bg = false,
    transparent_cursorline = false,
    -- Choose a preset style for diagnostic appearance
    -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = "classic",
    signs = {
        left = "",
        right = "",
        diag = "●",
        arrow = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └",
    },
    hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "None",
    },
    blend = {
        factor = 0.22,
    },
})
