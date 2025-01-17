return {
	"echasnovski/mini.splitjoin",
	version = "*",
	opts = {
		mappings = {
			toggle = "<leader>j",
			split = "",
			join = ""
		}
	},
	config = function(_, opts)
		require("mini.splitjoin").setup(opts)
	end
}
