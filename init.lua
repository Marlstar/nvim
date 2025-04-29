require("vimrc")

require("lazy.install")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy.run")

require("colour")
require("mappings").main()
require("wsl")
