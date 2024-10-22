return {
    "jaimecgomezz/here.term",
	event = "VeryLazy",
	config = function ()
		vim.opt.hidden = true
		require("here-term").setup({
			startup_command = "Alpha",

			mappings = {
				toggle = "<C-;>",
				kill = "<C-S-;>",
			}
		})
	end
}
