return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup{
			direction = "float",
			start_in_insert = true,
			terminal_mappings = true,

			float_opts = {
				border = "curved",
				title_pos = "center"
			}
		}
	end
}
