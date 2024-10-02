return function()
	local language = vim.bo.filetype;

	if language == "typst" then
		vim.cmd("TypstPreview")
		return
	end

	vim.cmd("RunCode")
end
