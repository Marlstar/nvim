return {
    "jaimecgomezz/here.term",
	keys = { "<C-;", "<C-S-;>" },
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
