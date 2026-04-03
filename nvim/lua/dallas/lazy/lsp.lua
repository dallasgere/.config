return {
    "neovim/nvim-lspconfig", -- provides server definitions (cmd, filetypes, root markers)
    dependencies = {
        "saghen/blink.cmp",
        "j-hui/fidget.nvim",
    },
    config = function()
        -- fnm default node bin (where vtsls, pyright, html/css servers live)
        local fnm_bin = vim.fn.expand("~/.local/share/fnm/aliases/default/bin")
        if vim.fn.isdirectory(fnm_bin) == 1 then
            vim.env.PATH = fnm_bin .. ":" .. vim.env.PATH
        end

        require("fidget").setup({})

        -- Apply capabilities globally to all servers
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- Per-server overrides (only what differs from lspconfig defaults)
        vim.lsp.config("vtsls", {
            settings = {
                vtsls = { autoUseWorkspaceTsdk = true },
            },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    },
                },
            },
        })

        vim.lsp.enable({ "vtsls", "html", "cssls", "biome", "pyright", "lua_ls" })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
            virtual_text = {
                spacing = 2,
                prefix = "●",
                severity = nil,
            },
        })
    end,
}
