-- remove blank from sessionoptions
vim.opt.sessionoptions:remove("blank")

-- always have relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- hiding default status line
vim.opt.showmode = false

-- setting indent for certain files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "js", "ts", "jsx", "tsx", "css", "html" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
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

-- autoindent preserves current indent on new lines; smartindent is superseded by treesitter
vim.opt.autoindent = true
vim.opt.smartindent = false

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
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- setting the leader key to space bar
vim.g.mapleader = " "

-- adjusting netrw
vim.g.netrw_banner = 0

-- guide for column size
-- vim.opt.colorcolumn = "81"
