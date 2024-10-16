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
local gethl = require("util.colour").hl
local getfg = require("util.colour").hl_fg
local getbg = require("util.colour").hl_bg
local mode_colors = {
	NORMAL = { fg = "blue", bg = getbg("Normal") },
	["O-PENDING"] = { fg = "blue", bg = getbg("Normal") },
	INSERT = { fg = "green", bg = getbg("Normal") },
	VISUAL = { fg = "purple", bg = getbg("Normal") },
	["V-LINE"] = { fg = "purple", bg = getbg("Normal") },
	["V-BLOCK"] = { fg = "purple", bg = getbg("Normal") },
	SELECT = { fg = "purple", bg = getbg("Normal") },
	["S-LINE"] = { fg = "purple", bg = getbg("Normal") },
	["S-BLOCK"] = { fg = "purple", bg = getbg("Normal") },
	REPLACE = { fg = "orange", bg = getbg("Normal") },
	MORE = { fg = "orange", bg = getbg("Normal") },
	["V-REPLACE"] = { fg = "orange", bg = getbg("Normal") },
	COMMAND = { fg = "yellow", bg = getbg("Normal") },
	EX = { fg = "yellow", bg = getbg("Normal") },
	CONFIRM = { fg = "yellow", bg = getbg("Normal") },
	SHELL = { fg = "yellow", bg = getbg("Normal") },
	TERMINAL = { fg = "yellow", bg = getbg("Normal") },
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
