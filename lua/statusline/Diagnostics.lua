local get_hl = require("util.colour").get_hl

local Diagnostics = {
	condition = require("heirline.conditions").has_diagnostics,

	static = {
		error_icon = " ",
		warn_icon = " ",
		info_icon = " ",
		hint_icon = "󰌵 "
	},

	init = function (self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },

	{ -- Errors
		provider = function (self)
			return self.errors > 0
				and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = get_hl("DiagnosticError").fg }
	},
	{ -- Warnings
		provider = function (self)
			return self.warnings > 0
				and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = get_hl("DiagnosticWarn").fg }
	},
	{ -- Info
		provider = function (self)
			return self.info > 0
				and (self.info_icon .. self.info .. " ")
		end,
		hl = { fg = get_hl("DiagnosticInfo").fg }
	},
	{ -- Errors
		provider = function (self)
			return self.hints > 0
				and (self.hint_icon .. self.hints .. " ")
		end,
		hl = { fg = get_hl("DiagnosticHint").fg }
	},
}

return Diagnostics
