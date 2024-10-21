local get_hl = require("util.colour").get_hl

local mode_names = {
    ["n"] = "NORMAL",
    ["no"] = "O-PENDING",
    ["nov"] = "O-PENDING",
    ["noV"] = "O-PENDING",
    ["no\22"] = "O-PENDING",
    ["niI"] = "NORMAL",
    ["niR"] = "NORMAL",
    ["niV"] = "NORMAL",
    ["nt"] = "NORMAL",
    ["ntT"] = "NORMAL",
    ["v"] = "VISUAL",
    ["vs"] = "VISUAL",
    ["V"] = "V-LINE",
    ["Vs"] = "V-LINE",
    ["\22"] = "V-BLOCK",
    ["\22s"] = "V-BLOCK",
    ["s"] = "SELECT",
    ["S"] = "S-LINE",
    ["\19"] = "S-BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["ix"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rc"] = "REPLACE",
    ["Rx"] = "REPLACE",
    ["Rv"] = "V-REPLACE",
    ["Rvc"] = "V-REPLACE",
    ["Rvx"] = "V-REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "EX",
    ["ce"] = "EX",
    ["r"] = "REPLACE",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}
local mode_colors = {
	NORMAL = { fg = "blue", bg = get_hl("Normal").bg },
	["O-PENDING"] = { fg = "blue", bg = get_hl("Normal").bg },
	INSERT = { fg = "green", bg = get_hl("Normal").bg },
	VISUAL = { fg = "purple", bg = get_hl("Normal").bg },
	["V-LINE"] = { fg = "purple", bg = get_hl("Normal").bg },
	["V-BLOCK"] = { fg = "purple", bg = get_hl("Normal").bg },
	SELECT = { fg = "purple", bg = get_hl("Normal").bg },
	["S-LINE"] = { fg = "purple", bg = get_hl("Normal").bg },
	["S-BLOCK"] = { fg = "purple", bg = get_hl("Normal").bg },
	REPLACE = { fg = "orange", bg = get_hl("Normal").bg },
	MORE = { fg = "orange", bg = get_hl("Normal").bg },
	["V-REPLACE"] = { fg = "orange", bg = get_hl("Normal").bg },
	COMMAND = { fg = "yellow", bg = get_hl("Normal").bg },
	EX = { fg = "yellow", bg = get_hl("Normal").bg },
	CONFIRM = { fg = "yellow", bg = get_hl("Normal").bg },
	SHELL = { fg = "yellow", bg = get_hl("Normal").bg },
	TERMINAL = { fg = "yellow", bg = get_hl("Normal").bg },
}

local ViMode = {
	init = function (self)
		self.mode = vim.fn.mode(1)
	end,

	provider = function(self)
		return "%2( "..mode_names[self.mode].." %)"
		-- return mode_names[self.mode]
	end,

	hl = function(self)
		local mode_name = mode_names[self.mode] or "???"
		local mode_hl = mode_colors[mode_name] or mode_colors.NORMAL
		return {
			fg = mode_hl.bg,
			bg = mode_hl.fg,
			bold = true,
		}
	end,

	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

return ViMode
