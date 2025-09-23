return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "j-hui/fidget.nvim",
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "html" },
            automatic_enable = true,
        })

        -- Default setup for all installed servers
        local lspconfig = require("lspconfig")
        -- HTML
        vim.lsp.config["html"] = {
            capabilities = capabilities,
            filetypes = { "html" },
        }
        
        -- Lua
        vim.lsp.config["lua_ls"] = {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    },
                },
            },
        }

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {},
            mapping = cmp.mapping.preset.insert({
                ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<TAB>']  = cmp.mapping.select_next_item(cmp_select),
                ['<CR>']   = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({ { name = 'nvim_lsp' } }, { { name = 'buffer' } })
        })

        vim.diagnostic.config({
            float = {
                focusable = false, style = "minimal", border = "rounded",
                source = "always", header = "", prefix = "",
            },
            virtual_text = {
                spacing = 2,
                prefix = "●",
                severity = nil,
            },
        })

        -- this causes issues with eslint so I am just not messing with it rn and formatting through the cli
        -- vim.api.nvim_create_autocmd('BufWritePre', {
        --     pattern = { '*.js', '*.ts', '*.tsx', '*.jsx', '*.html', '*.css' },
        --     callback = function() vim.lsp.buf.format() end
        -- })
    end,
}

