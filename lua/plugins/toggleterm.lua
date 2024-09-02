return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup{
			direction = "float",

			float_opts = {
				border = "curved",
				title_pos = "center"
			}
		}
	end
}
