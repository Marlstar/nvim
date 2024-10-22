return {
	-- TODO test
	"folke/todo-comments.nvim",
	event = "VeryLazy",

	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		highlight = {
			multiline = false,
			keyword = "bg"
		}
	}
}
