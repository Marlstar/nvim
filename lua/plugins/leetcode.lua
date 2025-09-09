return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	cmd = "Leet",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		lang = "rust",
	},
}
