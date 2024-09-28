return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function ()
		vim.g.screenkey_statusline_component = true

		-- local screenkey = function ()
		-- 	return require("screenkey").get_keys()
		-- end

		require('lualine').setup{
			-- | A > B > C      X < Y < Z |
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { "filetype", "filename"  },

				lualine_x = { --[[screenkey]] },
				lualine_y = { "progress" },
				lualine_z = { "location" }
			}
		}
	end
}
