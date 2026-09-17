return {
    "saghen/blink.cmp",
    dependencies = {
        'saghen/blink.lib',
    },
    opts = {
        keymap = {
            preset        = "none",
            ["<S-TAB>"]   = { "select_prev", "fallback" },
            ["<TAB>"]     = { "select_next", "fallback" },
            ["<CR>"]      = { "accept", "fallback" },
            ["<C-Space>"] = { "show", "fallback" },
        },
        sources = {
            default = { "lsp", "buffer", "path" },
        },
    },
    version = '*',
    build = function()
        require('blink.cmp').build():pwait()
    end
}
