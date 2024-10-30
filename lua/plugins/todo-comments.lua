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
			DONE = { icon = "", color = "DONE", alt = {"FINISHED", "COMPLETE"}}
		},
		colors = {
			DONE = { "green", "DiffAdded", "#c3e88d" }
		}
	}
}
