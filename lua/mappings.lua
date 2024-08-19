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
map("n", "<C1>", ":BufferGoto 1<CR>")
map("n", "<C2>", ":BufferGoto 2<CR>")
map("n", "<C3>", ":BufferGoto 3<CR>")
map("n", "<C4>", ":BufferGoto 4<CR>")
map("n", "<C5>", ":BufferGoto 5<CR>")
map("n", "<C6>", ":BufferGoto 6<CR>")
map("n", "<C7>", ":BufferGoto 7<CR>")
map("n", "<C8>", ":BufferGoto 8<CR>")
map("n", "<C9>", ":BufferGoto 9<CR>")

-- clear highlight search by pressing ESC in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- comment
map("n", "<C-/>", "gcc")
map("v", "<C-/>", "gc")

