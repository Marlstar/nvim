local M = {}

--- @param name string
--- @return string
M.hl_fg = function (name)
	return vim.fn.synIDattr(
		vim.fn.synIDtrans(vim.fn.hlID(name)),
		"fg"
	)
end

--- @param name string
--- @return string
M.hl_bg = function (name)
	return vim.fn.synIDattr(
		vim.fn.synIDtrans(vim.fn.hlID(name)),
		"bg"
	)
end

--- @param name string
--- @return {fg: string, bg: string}
M.hl = function (name)
	return {
		fg = M.hl_fg(name),
		bg = M.hl_bg(name)
	}
end

return M
