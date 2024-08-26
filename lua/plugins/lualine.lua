M = {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

local screenkeys = function() return require("screenkey").get_keys() end

M.config = function ()
    require('lualine').setup{
		-- | A | B | C      X | Y | Z |
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "diff", "diagnostics" },
			lualine_c = { "filetype", "filename"  },

			lualine_x = { screenkeys },
			lualine_y = { "progress" },
			lualine_z = { "location" }
		}
	}
end

return M
