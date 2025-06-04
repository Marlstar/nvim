local M = {}

local function map(mode, key, map_, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, map_, options)
end
M.map = map


function M.esc()
	vim.cmd("nohl")
end


function M.main()
	map({"n","v"}, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
	map({"n","v"}, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
end
return M
