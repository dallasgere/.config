return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fc', ":Telescope current_buffer_fuzzy_find<CR>")
        vim.keymap.set("n", "<space>w", ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>", { noremap = true })
        vim.keymap.set("n", "<space>d", ":Telescope file_browser hidden=true<CR>")

        -- how to load reamaps for file browser
        local fb_actions = require "telescope".extensions.file_browser.actions

        -- this is all the file browser stuff
        require("telescope").load_extension "file_browser"

        require("telescope").setup {
          extensions = {
            file_browser = {
              -- theme = "ivy",
              -- disables netrw and use telescope-file-browser in its place
              hijack_netrw = true,
              mappings = {
                ["i"] = {
                  -- your custom insert mode mappings
                },
                ["n"] = {
                  -- your custom normal mode mappings
                },
              },
            },
          },
        }
    end
}

