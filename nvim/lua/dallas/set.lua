-- always have relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- hiding default status line
vim.opt.showmode = false

-- turning off the background
-- local function set_transparency()
--   vim.cmd([[
--     hi Normal guibg=NONE ctermbg=NONE
--     hi NormalNC guibg=NONE ctermbg=NONE
--     hi SignColumn guibg=NONE ctermbg=NONE
--     hi StatusLine guibg=NONE ctermbg=NONE
--     hi StatusLineNC guibg=NONE ctermbg=NONE
--     hi VertSplit guibg=NONE ctermbg=NONE
--     hi TabLine guibg=NONE ctermbg=NONE
--     hi TabLineFill guibg=NONE ctermbg=NONE
--     hi TabLineSel guibg=NONE ctermbg=NONE
--     hi Pmenu guibg=NONE ctermbg=NONE
--     hi PmenuSel guibg=NONE ctermbg=NONE
--     hi NormalFloat guibg=NONE ctermbg=NONE
--     hi NonText guibg=NONE ctermbg=NONE
--     hi NeoTreeNormal guibg=NONE ctermbg=NONE
--     hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
--     hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
--     hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
--     hi EndOfBuffer guibg=NONE ctermbg=NONE
--   ]])
-- end
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = set_transparency,
-- })
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = set_transparency,
-- })

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
--     vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
--   end
-- })
--
-- vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
-- vim.api.nvim_set_hl(0, "NormalFloat", {guibg=NONE})

-- setting indent for certain files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "js", "ts", "jsx", "tsx", "css", "html" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

-- cursor options
-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- vim.opt.guicursor = "n-v-c-i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.guicursor=""

-- tab options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- smart indent based on files
vim.opt.smartindent = true

-- idk
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- setting the leader key to space bar
vim.g.mapleader = " "

-- adjusting netrw
vim.g.netrw_banner = 0

-- guide for column size
-- vim.opt.colorcolumn = "81"
