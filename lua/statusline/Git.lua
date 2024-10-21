SHOW_BRANCH = true

local conditions = require("heirline.conditions")

local Git = {
	condition = function ()
		return conditions.is_git_repo()
			and vim.b.gitsigns_status_dict
	end,

	init = function (self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0
			or self.status_dict.removed ~= 0
			or self.status_dict.changed ~= 0
	end,

	hl = { fg = "blue" },

	{ -- Branch name
		condition = SHOW_BRANCH,
		provider = function (self)
			return " " .. self.status_dict.head .. " "
		end,
		hl = { bold = true }
	},

	{ -- Added
		provider = function (self)
			local count = self.status_dict.added or 0
			return "+" .. count .. " "
		end,
		hl = { fg = "green" }
	},
	{ -- Changed
		provider = function (self)
			local count = self.status_dict.changed or 0
			return "~" .. count .. " "
		end,
		hl = { fg = "yellow" }
	},
	{ -- Deleted
		provider = function (self)
			local count = self.status_dict.removed or 0
			return "-" .. count .. " "
		end,
		hl = { fg = "red" }
	},
}

return Git
