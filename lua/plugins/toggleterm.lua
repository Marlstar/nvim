return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup{
			direction = "float",
			start_in_insert = true,

			float_opts = {
				border = "curved",
				title_pos = "center"
			}
		}
	end
}
