return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup{
			
		}
		vim.notify = require("notify")
		require("telescope").load_extension("notify")
	end
}
