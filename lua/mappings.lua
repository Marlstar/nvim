local map = require("map")

vim.g.mapleader = " "

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")

-- Neoclip (yank history)
map("n", "<leader>y", ":Telescope neoclip<CR>")

-- Make navigation keys work within line wraps
map("n", "j", "gj")
map("n", "k", "gk")

-- Toggle tree
map("n", "<leader>t", ":NvimTreeToggle<CR>")

-- Buffer navigation
map("n", "<leader>bn", ":BufferNext<CR>")
map("n", "<leader>bp", ":BufferPrevious<CR>")

-- Tabs
map("n", "<C-1>", ":BufferGoto 1<CR>")
map("n", "<C-2>", ":BufferGoto 2<CR>")
map("n", "<C-3>", ":BufferGoto 3<CR>")
map("n", "<C-4>", ":BufferGoto 4<CR>")
map("n", "<C-5>", ":BufferGoto 5<CR>")
map("n", "<C-6>", ":BufferGoto 6<CR>")
map("n", "<C-7>", ":BufferGoto 7<CR>")
map("n", "<C-8>", ":BufferGoto 8<CR>")
map("n", "<C-9>", ":BufferGoto 9<CR>")

-- clear highlight search by pressing ESC in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- comment
map("n", "<C-/>", "gcc")
map("v", "<C-/>", "gc")

-- Bind F5 to useful things per file type
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua ' ..
    'local file_name = vim.fn.expand("%:t") ' ..
    'if file_name:match("%.py$") then ' ..
        'vim.api.nvim_command("!python %") ' ..
    'elseif file_name:match("%.rs$") then ' ..
        'vim.api.nvim_command("term") ' ..
    'elseif file_name:match("%.typ") then '..
        'vim.api.nvim_command("TypstPreview")' ..
    'else ' ..
        'print("Unsupported file type") ' ..
    'end<CR>', { noremap = true, silent = true })


