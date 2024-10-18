local conditions = require("heirline.conditions")
local get_hl = require("util.colour").get_hl

-- Define children and add them later
local FileIcon = {
	init = function (self)
		local filename = vim.api.nvim_buf_get_name(0)
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_colour = require("nvim-web-devicons")
		.get_icon_color(filename, extension)
	end,

	provider = function (self)
		return self.icon and (" " .. self.icon .. " ")
	end,

	hl = function (self)
		return { fg = self.icon_colour }
	end
}

local FileName = {
	provider = function (self)
		-- Trim pattern relative to cwd
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
		if filename == "" then return " [No Name] " end
		-- If filename is longer than available space, trim
		if not conditions.width_percent_below(#filename, 0.35) then
			filename = vim.fn.pathshorten(filename)
		end

		return filename .. " "
	end,

	hl = { fg = get_hl("Directory").fg }
}

local FileFlags = {
	{ -- File modified
		condition = function() return vim.bo.modified end,
		provider = " ",
		hl = { fg = "green" }
	},
	{ -- Readonly
		condition = function ()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = " ",
		hl = { fg = "orange" }
	},
}

local FileNameBlock = {
	FileIcon,
	FileName,
	FileFlags,
	-- Cut the statusline here if there's not enough space
	{ provider = "%<" },
	-- Trailing whitespace for spacing
}

return FileNameBlock
