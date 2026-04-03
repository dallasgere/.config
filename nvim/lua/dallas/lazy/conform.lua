return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                javascript = { "biome" },
                javascriptreact = { "biome" },
                typescript = { "biome" },
                typescriptreact = { "biome" },
                json = { "biome" },
                css = { "biome" },
                html = { "biome" },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        })
    end,
}

