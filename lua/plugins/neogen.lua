-- For annotations
return {
    "danymat/neogen",
    enabled = true,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
}
