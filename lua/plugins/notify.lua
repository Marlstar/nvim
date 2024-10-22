return {
	"rcarriga/nvim-notify",
	event = { "VeryLazy" },

	config = function()
		require("notify").setup{
			
		}
		vim.notify = require("notify")
		require("telescope").load_extension("notify")
	end
}
