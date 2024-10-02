return {
    "jaimecgomezz/here.term",
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
