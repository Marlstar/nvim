return {
	"r-pletnev/pdfreader.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/snacks.nvim", -- image rendering
		"nvim-telescope/telescope.nvim", -- pickers
	},
	config = function() -- Doesn't work without manually calling setup for whatever reason
		require("pdfreader").setup()
	end,
}
