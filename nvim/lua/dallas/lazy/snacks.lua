return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true, timeout = 5000 },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        lazygit = { enabled = true }
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        vim.keymap.set('n', '<leader>lg', function()
            require("snacks.lazygit").open()
        end, { desc = "Open LazyGit via Snacks" })
    end,
}

