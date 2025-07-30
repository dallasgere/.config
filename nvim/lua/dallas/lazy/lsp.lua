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
        lspconfig.html.setup {
            capabilities = capabilities,
            filetypes = { "html" },
        }
        -- Lua (custom settings)
        lspconfig.lua_ls.setup {
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
        })
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = { '*.js', '*.ts', '*.tsx', '*.jsx', '*.html', '*.css' },
            callback = function() vim.lsp.buf.format() end
        })
    end,
}



-- return {
--     -- the name of the actual plugin
--     "neovim/nvim-lspconfig",
--
--     -- dependencies for lsp
--     dependencies = {
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-cmdline",
--         "hrsh7th/nvim-cmp",
--         "j-hui/fidget.nvim",
--     },
--
--     -- config function
--     config = function()
--         -- packages I need
--         local cmp = require('cmp')
--         local cmp_lsp = require("cmp_nvim_lsp")
--
--         -- set up LSP capabilities
--         local capabilities = vim.tbl_deep_extend(
--             "force",
--             {},
--             vim.lsp.protocol.make_client_capabilities(),
--             cmp_lsp.default_capabilities()
--         )
--
--         -- set up fidget (loading spinner)
--         require("fidget").setup({})
--
--         -- set up Mason (LSP installer)
--         require("mason").setup()
--
--         -- configure Mason-LSPConfig
--         require("mason-lspconfig").setup({
--             ensure_installed = { "html" },
--
--             handlers = {
--                 -- default handler for all LSPs
--                 function(server_name)
--                     require("lspconfig")[server_name].setup {
--                         capabilities = capabilities
--                     }
--                 end,
--
--                 -- custom handler for lua language server
--                 ["lua_ls"] = function()
--                     require("lspconfig").lua_ls.setup {
--                         capabilities = capabilities,
--                         settings = {
--                             Lua = {
--                                 runtime = { version = "Lua 5.1" },
--                                 diagnostics = {
--                                     globals = { "vim", "it", "describe", "before_each", "after_each" },
--                                 }
--                             }
--                         }
--                     }
--                 end,
--
--                 -- html handler
--                 ["html"] = function()
--                     require("lspconfig").html.setup {
--                         capabilities = capabilities,
--                         filetypes = {"html"},
--                     }
--                 end,
--             }
--         })
--
--         -- setup nvim-cmp for autocompletion
--         local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
--         cmp.setup({
--             snippet = {},
--             mapping = cmp.mapping.preset.insert({
--                 ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
--                 ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
--                 ['<CR>'] = cmp.mapping.confirm({ select = true }),
--                 ["<C-Space>"] = cmp.mapping.complete(),
--             }),
--             sources = cmp.config.sources({
--                 { name = 'nvim_lsp' },
--             }, {
--                     { name = 'buffer' },
--                 })
--         })
--
--         -- configure diagnostic display
--         vim.diagnostic.config({
--             float = {
--                 focusable = false,
--                 style = "minimal",
--                 border = "rounded",
--                 source = "always",
--                 header = "",
--                 prefix = "",
--             },
--         })
--
--         -- format on save
--         vim.api.nvim_create_autocmd('BufWritePre', {
--             pattern = { '*.js', '*.ts', '*.tsx', '*.jsx', '*.html', '*.css' },
--             callback = function()
--                 vim.lsp.buf.format()
--             end
--         })
--     end
-- }

