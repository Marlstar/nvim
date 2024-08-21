local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
---------------------------------------------------------
---------------------------------------------------------

vim.g.mapleader = " "



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

