local function map(mode, key, map, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, map, options)
end

map("n", "<Esc>", "<cmd>nohl<CR>")
