-- numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab && indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.o.breakindent = true

-- lines
vim.opt.wrap = true
vim.opt.smarttab = true

-- undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- colors
vim.opt.termguicolors = true
vim.cmd("colorscheme catppuccin")

-- misc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.o.mouse = "a"

vim.o.completeopt = "menuone,noselect"
