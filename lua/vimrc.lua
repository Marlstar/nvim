vim.cmd([[
	set expandtab
	set ts=4
	set sw=4
	set guioptions-=m
	set guioptions-=T
	set scrolloff=5
	set number 
	set formatoptions=1
	set smarttab
	set wildmenu
	set wildmode=longest,full
	set lbr
	set showmatch
	set ruler
	set wmh=0
	set showmode
	set cursorline
	set ttyfast
	set formatoptions=qrn1
	set encoding=utf-8
    set autoindent
	set formatoptions-=cro
]])


vim.o.guifont = "Cascadia Code"
vim.g.guifont = "Cascadia Code"
require("neovide")

vim.o.termguicolors = true

require("mappings")
-- require("autocmd")
require("lsp.tinymist")
