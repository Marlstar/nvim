local map = require("map")

vim.g.mapleader = " "

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>ft", ":TodoTelescope<CR>")

-- Neoclip (yank history)
map("n", "<leader>y", ":Telescope neoclip<CR>")

-- Code running
map("n", "<F5>", require("run-code"))

-- ToggleTerm
map("n", "<C-\\>", ":ToggleTerm direction=float<CR>") -- Open floating terminal
map("t", "<ESC>", [[<C-\><C-n>]])
map("t", "<C-w>", [[<C-\><C-n><C-w>]])

-- Make navigation keys work within line wraps
map("n", "j", "gj")
map("n", "k", "gk")
-- And instead make instant line movement explicit
map("n", "gj", "j")
map("n", "gk", "k")

-- Toggle tree
map("n", "<leader>t", ":NvimTreeToggle<CR>")

-- Buffer navigation
map("n", "<leader>bn", ":BufferNext<CR>")
map("n", "<leader>bp", ":BufferPrevious<CR>")
map("n", "<leader>x", ":bd<CR>") -- Close buffer
map("n", "<leader>X", ":bd!<CR>") -- Close buffer (force)

-- Write buffer
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>W", ":w<CR>:bd<CR>") -- Write and close buffer

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

