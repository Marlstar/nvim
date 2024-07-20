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
	set formatoptions-=cro
]])

vim.o.guifont = "MonaspiceAr Nerd Font"
vim.g.guifont = "MonaspiceAr Nerd Font"
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.5

-- clear highlight search by pressing ESC in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
