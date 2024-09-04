return function()
	local language = vim.bo.filetype;

	if language == "typst" then
		vim.cmd("Typst preview")
		return
	end

	vim.cmd("RunCode")
end
