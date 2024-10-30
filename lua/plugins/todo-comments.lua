return {
	-- TODO test
	"folke/todo-comments.nvim",
	event = "VeryLazy",

	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			multiline = false,
			keyword = "wide_bg"
		},
		keywords = {
			DONE = { icon = "", color = "DONE", alt = {"FINISHED", "COMPLETE"}},
			REVIEW = { icon = "", color = "REVIEW", alt = {"CHECK"}},
		},
		colors = {
			DONE = { "green", "DiffAdded", "#c3e88d" },
			REVIEW = { "blue", "MiniIconsBlue", "#82aaff" }
		}
	}
}
