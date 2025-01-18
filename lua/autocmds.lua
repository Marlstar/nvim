-- Auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
    command = "wincmd =",
})

-- Autocreate dirs when writing files
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Autocreate a dir when saving a file",
	group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
