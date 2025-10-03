return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = false },
        picker = { enabled = true },
        notifier = { enabled = false, timeout = 5000 },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = false },
        lazygit = { enabled = true }
    },
    config = function(_, opts)
        require("snacks").setup(opts)
        vim.keymap.set('n', '<leader>lg', function()
            require("snacks.lazygit").open()
        end, { desc = "Open LazyGit via Snacks" })
    end,
}

