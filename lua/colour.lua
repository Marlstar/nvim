-- Colorscheme
vim.cmd("colorscheme tokyonight-moon")

-- Replace undercurls with underlines
local highlights = vim.api.nvim_get_hl(0, {})
for name, opts in pairs(highlights) do
	if opts.undercurl then
		opts.undercurl = nil
		opts.underline = true
		vim.api.nvim_set_hl(0, name, opts)
	end
end
