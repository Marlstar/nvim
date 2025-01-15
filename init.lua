require("vimrc")

require("lazy.install")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy.run")

vim.cmd("colorscheme tokyonight-moon")
