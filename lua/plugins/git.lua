return {
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			graph_style = "kitty",
			kind = "floating",
		},
		keys = {
			{ "<leader>g", function() require("neogit").open() end, "Open Neogit" },
		}
	}
}
