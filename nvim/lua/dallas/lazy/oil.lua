return {
    'stevearc/oil.nvim',
    opts = {
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, ".")
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
                return false
            end,
        },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function(_, opts)
        -- Initialize Oil with the opts defined above
        require("oil").setup(opts)

        -- Set the keybinding to open Oil
        vim.keymap.set('n', '<leader>w', "<CMD>Oil<CR>", { desc = "Open Oil" })
    end
}
