return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup{
            open_mapping = [[<c-\>]],
            direction = "float",
            shade_terminals = true,
            float_opts = {
                border = 'curved',
                width = 195,
                height = 58,
            }
        }

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}
