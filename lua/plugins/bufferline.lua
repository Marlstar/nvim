return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			themable = false, -- use colourscheme colours
			separator_style = "slant",
			numbers = "none",
			max_name_length = 25,
			indicator = {
				style = "icon"
			},
		}
	},
	keys = {
		{ "<leader>bn", ":BufferLineCycleNext<CR>", desc = "Next tab", silent = true },
		{ "<leader>bp", ":BufferLineCyclePrev<CR>", desc = "Previous tab", silent = true },
		{ "<leader>bmn", ":BufferLineMoveNext<CR>", desc = "Move tab right", silent = true },
		{ "<leader>bmp", ":BufferLineMovePrev<CR>", desc = "Move tab left", silent = true },
	}
}
