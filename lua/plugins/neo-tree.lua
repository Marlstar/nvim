return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>tt", function() require("neo-tree.command").execute{ position="left", toggle=true } end, desc = "Neotree - standard" },
		{ "<leader>tf", function() require("neo-tree.command").execute{ position="float", toggle=true} end, desc = "Neotree - float"},
		{ "<leader>tg", function() require("neo-tree.command").execute{ source="git_status", toggle=true } end, desc = "Neotree - git status"},
		{ "<leader>tx", function() require("neo-tree.command").execute{ close=true } end, desc = "Neotree - close"},
	}
}
