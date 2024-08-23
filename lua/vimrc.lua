vim.o.expandtab = false -- Use spaces instead of tabs
vim.o.ts = 4 -- How many spaces in a tab
vim.o.sw = 4 -- How many spaces used during autoindent
vim.o.scrolloff = 6 -- How many lines to keep above/below the cursor when scrolling
vim.o.number = true -- Line numbers
vim.o.relativenumber = false -- Relative line numbers
vim.o.smarttab = true -- Smart tab
vim.o.wildmenu = true
vim.o.wildmode = "longest,full"
vim.o.lbr = true -- Wrap at smart points rather than just the last character that fits
vim.o.showmatch = false -- Briefly move to the matching bracket when closing it
vim.o.wmh = 0 -- Minimum subwindow size
vim.o.cursorline = true -- Highlight the line that the cursor is on
vim.o.formatoptions = "qn1"
vim.o.encoding = "UTF-8"
vim.o.autoindent = true -- Auto-indent when making new lines

-- Status line
vim.o.ruler = true -- Line and column numbers on the status line
vim.o.showmode = true -- Show mode on the status line

vim.opt.formatoptions:remove({"c", "r", "o"})


local font = "JetbrainsMono Nerd Font"
vim.o.guifont = font
vim.g.guifont = font

require("neovide")

vim.o.termguicolors = true

require("mappings")
