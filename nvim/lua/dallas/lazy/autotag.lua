return {
    'windwp/nvim-ts-autotag',
    config = function()
        require('nvim-ts-autotag').setup({
            filetypes = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "tsx", "jsx" },
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false
            },
        })
    end
}

