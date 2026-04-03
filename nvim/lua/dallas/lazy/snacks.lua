return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = {
            enabled = true,
            replace_netrw = true,
            trash = true,
        },
        picker = {
            enabled = true,
            -- Layout presets — uncomment one at a time to try:
            layout = { preset = "ivy" },        -- bottom bar, results + preview side by side
            -- layout = { preset = "ivy_split" }, -- like ivy but preview opens in main window
            -- layout = { preset = "telescope" }, -- classic telescope: results left, preview right, input at bottom
            -- layout = { preset = "default" },   -- floating: input+list left, preview right
            -- layout = { preset = "vertical" },  -- tall floating center: input → list → preview stacked
            -- layout = { preset = "dropdown" },  -- narrow floating center column, no preview
            -- layout = { preset = "vscode" },    -- top-center command palette style, no preview
            -- layout = { preset = "sidebar" },   -- left sidebar (same as explorer style)
            -- layout = { preset = "right" },     -- right sidebar
            -- layout = { preset = "top" },       -- ivy anchored to top instead of bottom
            sources = {
                grep = {
                    -- treat input as literal text so special chars like ( ) [ don't break search
                    args = { "--fixed-strings" },
                },
            },
        },
        indent = { enabled = true },
        input = { enabled = false },
        notifier = { enabled = false, timeout = 5000 },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
        lazygit = { enabled = true }
    },

    config = function(_, opts)
        require("snacks").setup(opts)

        -- Picker keybindings (migrated from telescope)
        vim.keymap.set('n', '<leader>ff', function() Snacks.picker.files() end, { desc = "Find files" })
        vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = "Live grep" })
        vim.keymap.set('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = "Buffers" })
        vim.keymap.set('n', '<leader>fh', function() Snacks.picker.help() end, { desc = "Help tags" })
        vim.keymap.set('n', '<leader>fc', function() Snacks.picker.lines() end, { desc = "Current buffer lines" })
        vim.keymap.set('n', '<leader>fr', function() Snacks.picker.recent() end, { desc = "Recent files" })
        vim.keymap.set('n', '<leader>fd', function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
        vim.keymap.set('n', '<leader>fq', function() Snacks.picker.qflist() end, { desc = "Quickfix list" })
        vim.keymap.set('n', '<leader>fu', function() Snacks.picker.undo() end, { desc = "Undo history" })
        vim.keymap.set('n', '<leader>fk', function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
        vim.keymap.set('n', '<leader>gs', function() Snacks.picker.git_status() end, { desc = "Git status" })
        vim.keymap.set('n', '<leader>gl', function() Snacks.picker.git_log() end, { desc = "Git log" })

        -- lazygit
        vim.keymap.set('n', '<leader>lg', function()
            require("snacks.lazygit").open()
        end, { desc = "Open LazyGit with snacks" })

        -- explorer
        vim.keymap.set('n', '<leader>e', function()
            Snacks.explorer({ reveal = true })
        end, { desc = "Open explorer with snacks" })

        -- File browser equivalents (migrated from telescope-file-browser)
        vim.keymap.set('n', '<space>w', function()
            Snacks.explorer({ cwd = vim.fn.expand('%:p:h'), reveal = true })
        end, { noremap = true, desc = "Explorer (current file dir)" })
        vim.keymap.set('n', '<space>d', function()
            Snacks.explorer()
        end, { desc = "Explorer (cwd)" })
    end,
}

