return {
    "saghen/blink.cmp",
    build = "cargo build --release",
    opts = {
        keymap = {
            preset = "none",
            ["<S-TAB>"]   = { "select_prev", "fallback" },
            ["<TAB>"]     = { "select_next", "fallback" },
            ["<CR>"]      = { "accept", "fallback" },
            ["<C-Space>"] = { "show", "fallback" },
        },
        sources = {
            default = { "lsp", "buffer", "path" },
        },
    },
}
